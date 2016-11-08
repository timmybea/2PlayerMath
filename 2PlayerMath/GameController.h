//
//  GameController.h
//  2PlayerMath
//
//  Created by Tim Beals on 2016-11-07.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameController : NSObject

@property (nonatomic) Player *activePlayer;

- (NSString *)changeActivePlayer;
- (NSInteger)player1Lives;
- (NSInteger)player2Lives;

@end
