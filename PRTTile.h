//
//  PRTTile.h
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRTWeapon.h"
#import "PRTArmour.h"
#import "PRTBoss.h"

@interface PRTTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) PRTWeapon *weapon;
@property (strong, nonatomic) PRTArmour *armour;
@property (nonatomic) int healthEffect;
@property (strong, nonatomic) PRTBoss *boss;



@end
