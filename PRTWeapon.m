//
//  PRTWeapon.m
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import "PRTWeapon.h"

@implementation PRTWeapon


-(id) initWithTitle:(NSString *) title andDamage: (int) damage{
    
   self = [super init];
    
    self.weaponDamage = damage;
    self.title = title;
    
    return self;
    
    
}
@end
