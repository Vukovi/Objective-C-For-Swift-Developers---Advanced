//
//  DelegatePattern.m
//  Advanced Objective C - Design Patterns
//
//  Created by Vuk Knežević on 4/30/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "DelegatePattern.h"

@implementation DelegatePattern

-(void)delegateCompleted {
    [self.delegate completed:self];
}

@end
