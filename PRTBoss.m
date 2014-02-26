//
//  PRTBoss.m
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import "PRTBoss.h"

@implementation PRTBoss

-(id) initWithHealth: (int) health andDamage: (int) damage{
    
    self = [super init];
    self.health = health;
    self.damage = damage;
    
    return self;
}


@end
