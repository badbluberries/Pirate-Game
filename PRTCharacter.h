//
//  PRTCharacter.h
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRTArmour.h"
#import "PRTWeapon.h"

@interface PRTCharacter : NSObject

@property (strong,nonatomic) PRTArmour *armour;
@property (strong,nonatomic) PRTWeapon *weapon;
@property (nonatomic) int health;
@property (nonatomic) int damage;

@end
