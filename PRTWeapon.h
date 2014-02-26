//
//  PRTWeapon.h
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRTWeapon : NSObject

@property (strong, nonatomic) NSString *title;
@property (nonatomic) int weaponDamage;

-(id) initWithTitle:(NSString *) title andDamage: (int) damage;


@end
