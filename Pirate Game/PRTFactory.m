//
//  PRTFactory.m
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import "PRTFactory.h"

@implementation PRTFactory

-(NSArray *) generateTiles
{
    PRTTile *tile1 = [[PRTTile alloc]init];
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.story = @"Test text";
    tile1.actionButtonName = @"Action";
    
    PRTTile *tile2 = [[PRTTile alloc]init];
    tile2.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile2.story = @"You have reached a friendly dock";
    tile2.actionButtonName = @"Do Nothing!";
    tile2.healthEffect = -10;
    
    PRTTile *tile3 = [[PRTTile alloc]init];
    tile3.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile3.story = @"SQWAK";
    tile3.actionButtonName = @"Feed the Bird";
    
    NSArray *firstRowArray = [NSArray arrayWithObjects:tile1,tile2,tile3, nil];
    
//    return firstRowArray;

    PRTTile *tile4 = [[PRTTile alloc]init];
    tile4.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile4.story = @"You meet a blacksmith";
    tile4.actionButtonName = @"Get a brand new sword";
    tile4.weapon = [[PRTWeapon alloc]initWithTitle:@"Steel Blade" andDamage:25];
    
    PRTTile *tile5 = [[PRTTile alloc]init];
    tile5.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile5.story = @"You found Treasure!!!";
    tile5.actionButtonName = @"Pick up the Shiny Treasure";
    tile5.armour = [[PRTArmour alloc]initWithTitle:@"The Heroes Shield" andStrength:20];
    
    PRTTile *tile6 = [[PRTTile alloc]init];
    tile6.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile6.story = @"Time to attack the enemy";
    tile6.actionButtonName = @"ATTACK!!!";
    
    NSArray *secondRowArray = [NSArray arrayWithObjects:tile4,tile5,tile6, nil];

    PRTTile *tile7 =[[PRTTile alloc]init];
    tile7.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile7.story = @"It's an Octopus, What to do?";
    tile7.actionButtonName = @"Octopus Attack";
    
    PRTTile *tile8 = [[PRTTile alloc]init];
    tile8.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile8.story = @"This is it, the BIG one!";
    tile8.actionButtonName = @"Strike him down";
    tile8.boss = [[PRTBoss alloc]initWithHealth:100 andDamage:5];
    
    PRTTile *tile9 = [[PRTTile alloc]init];
    tile9.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile9.story = @"Walk the plank ye scurvy dog!";
    tile9.actionButtonName = @"Walk";
    
    NSArray *thirdRowArray = [NSArray arrayWithObjects:tile7,tile8,tile9, nil];
    
    PRTTile *tile10 = [[PRTTile alloc]init];
    tile10.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile10.story = @"A huge battle errupts between the pirate lords";
    tile10.actionButtonName = @"Sink or Swim";
    
    PRTTile *tile11 = [[PRTTile alloc]init];
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.story = @"More Treasure, how lucky";
    tile11.actionButtonName = @"Pick Treasure";
    
    PRTTile *tile12 = [[PRTTile alloc]init];
    tile12.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile12.story = @"Here's the good stuff, this will do mega damage";
    tile12.actionButtonName = @"Tool Up Bruv";
    
    NSArray *fourthRowArray = [NSArray arrayWithObjects:tile10,tile11,tile12, nil];
    
    NSArray *theBigArray = [NSArray arrayWithObjects:firstRowArray,secondRowArray,thirdRowArray,fourthRowArray, nil];
    
    return theBigArray;
    
}

-(NSArray *) generateRandomTiles{
    
    NSArray *randomArray = [[NSArray alloc] init];
    return randomArray;
}

@end
