//
//  PRTBoss.h
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRTBoss : NSObject

@property(nonatomic) int health;
@property(nonatomic) int damage;

-(id) initWithHealth: (int) health andDamage: (int) damage;


@end
