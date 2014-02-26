//
//  PRTViewController.m
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import "PRTViewController.h"
#import "PRTFactory.h"
#import "PRTCharacter.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#define pirateWins 1
#define pirateLoses 2

@interface PRTViewController (){
    SystemSoundID gotItem;
    
}

@end

@implementation PRTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //set the intial gamegrid tile as 0,0
    self.gameGrid = CGPointMake(0, 0);
    
    //initialize an instance of the factory use it to generate the tile arrays
    self.rowArray = [[[PRTFactory alloc]init] generateTiles];
    
    //set current tile to the first tile in the first row and update UI
    self.currentTile = [[self.rowArray objectAtIndex:self.gameGrid.x] objectAtIndex:self.gameGrid.y];
    
    //create the Game Over Alert
    self.playerGameOver = [[UIAlertView alloc]initWithTitle:@"You Have Died" message:@"Uh-Oh" delegate:self cancelButtonTitle:@"Reset" otherButtonTitles: nil];
    self.playerGameOver.tag = pirateLoses;
    self.playerWins = [[UIAlertView alloc]initWithTitle:@"You Have Won" message:@"The cyclical nature of life means you must start again" delegate:self cancelButtonTitle:@"Square One" otherButtonTitles: nil];
    self.playerWins.tag = pirateWins;
    
    //Create the armour sound
    [self generateSounds];
    
    
    
    //initialise player one
    self.player = [[PRTCharacter alloc]init];
    self.player.health = 100;
    self.player.weapon = [[PRTWeapon alloc]initWithTitle:@"Big Stick" andDamage:10];
    self.player.damage = self.player.weapon.weaponDamage;
    self.player.armour = [[PRTArmour alloc]initWithTitle:@"Wooden Shield" andStrength:2];
    
    self.updatePirateWeapon.text = self.player.weapon.title;
    self.updatePirateDamage.text = [NSString stringWithFormat:@"%d", self.player.weapon.weaponDamage];
    self.updatePirateArmour.text = self.player.armour.title;
    
    [self updateUI];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) generateSounds{
    NSURL *weaponSound = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"OOT_Get_SmallItem1" ofType:@"wav"]];
    self.armourSound = [[AVAudioPlayer alloc]initWithContentsOfURL:weaponSound error:nil];
    [self.armourSound prepareToPlay];

}
- (IBAction)pirateActionPushed:(UIButton *)sender {
    
    if (!self.currentTile.boss) {
        if (self.currentTile.weapon) {
            
            self.player.weapon = self.currentTile.weapon;
           
            [self.armourSound play];
            [self updateUI];
            
        } else if (self.currentTile.armour){
            
            self.player.armour = self.currentTile.armour;
            NSString *pewPewPath = [[NSBundle mainBundle]
                                    pathForResource:@"OOT_Get_SmallItem1" ofType:@"wav"];
            NSURL *pewPewURL = [NSURL fileURLWithPath:pewPewPath];
            AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(pewPewURL), &gotItem);
            AudioServicesPlaySystemSound(gotItem);
            
            
            
            [self updateUI];
        }
        
    }else{
        self.player.health = (self.player.health - (self.currentTile.boss.damage - self.player.armour.armourStrength));
        self.currentTile.boss.health = (self.currentTile.boss.health - self.player.weapon.weaponDamage);
        if (self.currentTile.boss.health <= 0) {
            self.currentTile.boss.health = 100;
            [self.playerWins show];
        }else if (self.player.health <= 0){
            [self.playerGameOver show];
        }
        [self updateUI];
    }
    
}

- (IBAction)northButtonPushed:(UIButton *)sender {
    
    self.gameGrid = CGPointMake((self.gameGrid.x),(self.gameGrid.y + 1));
    [self updateUI];
}

- (IBAction)eastButtonPushed:(UIButton *)sender {
    
    self.gameGrid = CGPointMake((self.gameGrid.x +1), (self.gameGrid.y));
    [self updateUI];
}

- (IBAction)southButtonPushed:(UIButton *)sender {
    
    self.gameGrid = CGPointMake((self.gameGrid.x),(self.gameGrid.y - 1));
    [self updateUI];
}

- (IBAction)westButtonPushed:(UIButton *)sender {
    
    self.gameGrid = CGPointMake((self.gameGrid.x -1), (self.gameGrid.y));
    [self updateUI];
}

- (IBAction)resetButtonPushed:(UIButton *)sender {
    
    self.gameGrid = CGPointMake(0, 0);
    self.player.health = 100;
    self.player.weapon = [[PRTWeapon alloc]initWithTitle:@"Big Stick" andDamage:10];
    self.player.damage = self.player.weapon.weaponDamage;
    self.player.armour = [[PRTArmour alloc]initWithTitle:@"Wooden Shield" andStrength:0.8];
    [self updateUI];
}

-(void)updateHealth{
    
    self.player.health = (self.player.health + self.currentTile.healthEffect);
}

-(void) buttonStatusCheck{
    
    if (self.gameGrid.y == (self.tileArray.count -1)) {
        
        //disable Noth Button
        self.northButton.alpha = 0.2;
        self.northButton.enabled = NO;
        self.southButton.enabled = YES;
        self.southButton.alpha = 1;
        
    } else if (self.gameGrid.y == 0){
        
        //disble south button
        self.southButton.enabled = NO;
        self.southButton.alpha = 0.2;
        self.northButton.enabled = YES;
        self.northButton.alpha = 1;
        
    } else {
        self.southButton.enabled = YES;
        self.southButton.alpha = 1;
        self.northButton.enabled = YES;
        self.northButton.alpha = 1;
    }
    
    if (self.gameGrid.x == (self.rowArray.count - 1)) {
        
        self.eastButton.alpha = 0.2;
        self.eastButton.enabled = NO;
        self.westButton.enabled = YES;
        self.westButton.alpha = 1;
        
    } else if (self.gameGrid.x == 0){
        
        self.westButton.alpha = 0.2;
        self.westButton.enabled = NO;
        self.eastButton.enabled = YES;
        self.eastButton.alpha = 1;
        
    } else {
        self.westButton.enabled = YES;
        self.westButton.alpha = 1;
        self.eastButton.enabled = YES;
        self.eastButton.alpha = 1;
    }

}

-(void) checkHealth{
    if (self.player.health <= 0) {
        [self.playerGameOver show];
    }
}

-(void)updateUI{
    

    
    self.currentTile = [[self.rowArray objectAtIndex:self.gameGrid.x] objectAtIndex:self.gameGrid.y];
    self.tileArray = [self.rowArray objectAtIndex:self.gameGrid.x];
    [self updateHealth];
    [self checkHealth];
    
    //Update the Tile
    self.updatePirateImage.image = self.currentTile.backgroundImage;
    self.updatePirateStory.text = self.currentTile.story;
    self.updatePirateDamage.text = [NSString stringWithFormat:@"%i",self.player.weapon.weaponDamage];
    self.updatePirateWeapon.text = [NSString stringWithFormat:@"%@",self.player.weapon.title];
    self.updatePirateArmour.text = [NSString stringWithFormat:@"%@",self.player.armour.title];
    [self.updatePirateAction setTitle:self.currentTile.actionButtonName forState:UIControlStateNormal];
    self.updatePirateHealth.text = [NSString stringWithFormat:@"%i", self.player.health];
    
    
    //enable or diable vertical navigation buttons
    [self buttonStatusCheck];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == pirateWins) {
        if (buttonIndex == 0) {
            NSLog(@"Your Character Won!");
            self.gameGrid = CGPointMake(0, 0);
            self.player.health = 100;
            self.player.weapon = [[PRTWeapon alloc]initWithTitle:@"Big Stick" andDamage:10];
            self.player.damage = self.player.weapon.weaponDamage;
            self.player.armour = [[PRTArmour alloc]initWithTitle:@"Wooden Shield" andStrength:0.8];
            [self updateUI];
        }
        
    } else if (alertView.tag == pirateLoses){
        
        if (buttonIndex == 0) {
            NSLog(@"Your Pirate Lost!");
            self.gameGrid = CGPointMake(0, 0);
            self.player.health = 100;
            self.player.weapon = [[PRTWeapon alloc]initWithTitle:@"Big Stick" andDamage:10];
            self.player.damage = self.player.weapon.weaponDamage;
            self.player.armour = [[PRTArmour alloc]initWithTitle:@"Wooden Shield" andStrength:0.8];
            [self updateUI];
        }
        
    }
    
   }


@end
