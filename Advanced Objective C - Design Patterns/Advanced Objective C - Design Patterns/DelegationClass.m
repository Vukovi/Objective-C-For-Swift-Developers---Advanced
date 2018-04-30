//
//  DelegationClass.m
//  Advanced Objective C - Design Patterns
//
//  Created by Vuk Knežević on 4/30/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "DelegationClass.h"

@implementation DelegationClass

- (void)completed:(DelegationClass *)command {
    NSLog(@"Command completed");
}

@end
