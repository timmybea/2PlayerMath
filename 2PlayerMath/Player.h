//
//  Player.h
//  2PlayerMath
//
//  Created by Tim Beals on 2016-11-07.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic, assign) NSInteger lives;
- (instancetype)initWithName:(NSString *)name;

@end
