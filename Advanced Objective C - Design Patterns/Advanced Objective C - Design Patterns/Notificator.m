//
//  Notificator.m
//  Advanced Objective C - Design Patterns
//
//  Created by Vuk Knežević on 4/30/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "Notificator.h"

@implementation Notificator

-(void)publish {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_KEY object:self];
}

@end
