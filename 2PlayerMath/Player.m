//
//  Player.m
//  2PlayerMath
//
//  Created by Tim Beals on 2016-11-07.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "Player.h"

@interface Player ()

@end

@implementation Player

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    {
        _name = name;
        _lives = 3;
    }
    return self;
}

@end
