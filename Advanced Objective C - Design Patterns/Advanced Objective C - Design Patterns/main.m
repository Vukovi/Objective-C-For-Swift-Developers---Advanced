//
//  main.m
//  Advanced Objective C - Design Patterns
//
//  Created by Vuk Knežević on 4/30/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MySingleton.h"
#import "DelegatePattern.h"
#import "DelegationClass.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        MySingleton *ref1 = [MySingleton globalInstance];
        MySingleton *ref2 = [MySingleton globalInstance];
        if (ref1 == ref2) {
            NSLog(@"They are the same!");
        }
        
        DelegatePattern *command = [DelegatePattern new];
        DelegationClass *controller = [DelegationClass new];
        command.delegate = controller;
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
