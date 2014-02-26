//
//  PRTArmour.m
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import "PRTArmour.h"

@implementation PRTArmour

-(id) initWithTitle:(NSString *) title andStrength: (int) strength{
    
    self = [super init];
    
    self.armourStrength = strength;
    self.title = title;
    
    return self;
    
    
}



@end
