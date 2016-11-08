//
//  EquationGenerator.h
//  2PlayerMath
//
//  Created by Tim Beals on 2016-11-07.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquationGenerator : NSObject

@property (nonatomic, assign) NSString *answer;

-(NSString *)generateQuestion;

@end
