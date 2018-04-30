//
//  Observer.m
//  Advanced Objective C - Design Patterns
//
//  Created by Vuk Knežević on 4/30/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "Observer.h"

@implementation Observer

-(id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(observerMethod:) name:NOTIFICATION_KEY object:nil];
        // poslednji je nil jer hocu da primam notifikacije od svih, a ako hocu da primam notifikacije od samo jednog objekta onda moram njegovu instancu postaviti na mesto nila
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)observerMethod: (NSNotification *)note {
    NSLog(@"Notifikacija izvrsena");
}


@end
