//
//  PRTFactory.h
//  Pirate Game
//
//  Created by Colin McKinstry on 20/02/2014.
//  Copyright (c) 2014 Colin McKinstry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PRTTile.h"

@interface PRTFactory : NSObject

@property (strong, nonatomic) NSArray *tileArray;
@property (strong, nonatomic) NSArray *collumArray;


-(NSArray *) generateTiles;

-(NSArray *) generateRandomTiles;

@end
