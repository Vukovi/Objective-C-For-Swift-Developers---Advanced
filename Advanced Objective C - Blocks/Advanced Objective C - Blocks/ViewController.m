//
//  ViewController.m
//  Advanced Objective C - Blocks
//
//  Created by Vuk Knežević on 4/12/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "ViewController.h"

void doSomethingWithBlock(void (^theBlock)(NSString *)) {
    
}
// func doSomethingWithBlock(theBlock: Void) {}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    @autoreleasepool {
        void (^myBlock)(NSString *);
        myBlock = ^(NSString *x){
            NSLog(@"%@",x);
        };
        doSomethingWithBlock(myBlock);
    }

}


@end
