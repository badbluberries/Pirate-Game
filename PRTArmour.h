//
//  PRTArmour.h
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRTArmour : NSObject

@property (strong, nonatomic) NSString *title;
@property (nonatomic) int armourStrength;

-(id) initWithTitle:(NSString *) title andStrength: (int) strength;

@end
