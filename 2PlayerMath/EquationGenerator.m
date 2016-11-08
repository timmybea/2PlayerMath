//
//  EquationGenerator.m
//  2PlayerMath
//
//  Created by Tim Beals on 2016-11-07.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "EquationGenerator.h"

@interface EquationGenerator()

@property (nonatomic, assign) NSInteger a;
@property (nonatomic, assign) NSInteger b;
@property (nonatomic) NSString *question;

@end

@implementation EquationGenerator

-(int)ranValue {
    int lowerBound = 1;
    int upperBound = 20;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}

-(NSString *)generateQuestion {
    self.a = [self ranValue];
    self.b = [self ranValue];
    
    self.question = [NSString stringWithFormat:@"%ld + %ld = ", self.a, self.b ];
    
    self.answer = [NSString stringWithFormat:@"%ld", self.a + self.b];
    NSLog(@"%@", self.question);
    return self.question;
}

@end
