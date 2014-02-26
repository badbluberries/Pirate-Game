//
//  PRTViewController.h
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRTTile.h"
#import "PRTCharacter.h"
#import <AVFoundation/AVFoundation.h>


@interface PRTViewController : UIViewController <UIAlertViewDelegate>

//properties to update the contents and status of my buttons and labels
@property (strong, nonatomic) IBOutlet UIImageView *updatePirateImage;
@property (strong, nonatomic) IBOutlet UIButton *updatePirateAction;
@property (strong, nonatomic) IBOutlet UILabel *updatePirateHealth;
@property (strong, nonatomic) IBOutlet UILabel *updatePirateDamage;
@property (strong, nonatomic) IBOutlet UILabel *updatePirateWeapon;
@property (strong, nonatomic) IBOutlet UILabel *updatePirateArmour;
@property (strong, nonatomic) IBOutlet UILabel *updatePirateStory;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

@property (strong, nonatomic) NSArray *gameArray;
@property (strong, nonatomic) NSArray *rowArray;
@property (strong, nonatomic) NSArray *tileArray;
@property (strong, nonatomic) PRTCharacter *player;
@property (strong, nonatomic) UIAlertView *playerGameOver;
@property (strong, nonatomic) UIAlertView *playerWins;
@property (strong, nonatomic) AVAudioPlayer *armourSound;


//this property measures the position on the grid
@property (nonatomic) CGPoint gameGrid;
//This is the property that stores the current tile
@property (strong, nonatomic) PRTTile *currentTile;


//IBActions that trigger when my buttons are pressed
- (IBAction)pirateActionPushed:(UIButton *)sender;
- (IBAction)northButtonPushed:(UIButton *)sender;
- (IBAction)eastButtonPushed:(UIButton *)sender;
- (IBAction)southButtonPushed:(UIButton *)sender;
- (IBAction)westButtonPushed:(UIButton *)sender;
- (IBAction)resetButtonPushed:(UIButton *)sender;

-(void)updateUI;



@end
