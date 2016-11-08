//
//  GameController.m
//  2PlayerMath
//
//  Created by Tim Beals on 2016-11-07.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "GameController.h"


@interface GameController ()

@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;

@end

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _player1 = [[Player alloc] initWithName:@"Player 1"];
        _player2 = [[Player alloc] initWithName:@"Player 2"];
    }
    return self;
}

- (NSString *)changeActivePlayer
{
    if(self.activePlayer == nil)
    {
        self.activePlayer = self.player1;
    }
    else if(self.activePlayer == self.player1)
    {
        self.activePlayer = self.player2;
    }
    else
    {
        self.activePlayer = self.player1;
    }
    return self.activePlayer.name;
}

- (NSInteger)player1Lives
{
    return self.player1.lives;
}

- (NSInteger)player2Lives
{
    return self.player2.lives;
}

@end
