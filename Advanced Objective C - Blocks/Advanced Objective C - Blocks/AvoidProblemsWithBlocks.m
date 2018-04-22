//
//  AvoidProblemsWithBlocks.m
//  Advanced Objective C - Blocks
//
//  Created by Vuk Knežević on 4/12/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "AvoidProblemsWithBlocks.h"

@interface AvoidProblemsWithBlocks()
@property BOOL completed;
@property NSBlockOperation* networkOperation;
@end

@implementation AvoidProblemsWithBlocks

-(void)startNetworkOperationWithMemoryLeak {
    self.networkOperation = [[NSBlockOperation alloc]init];
    self.networkOperation.completionBlock = ^{
        _completed = YES; // ovde sa ovim underskorom treba "videti" self, jer je to u stvari umesto self.completed, a to je memory leak dakle isto sto i
        // self.completed = YES
        // [self setCompleted:YES];
    };
}

-(void)startNetworkOperationWithoutMemoryLeak {
    self.networkOperation = [[NSBlockOperation alloc]init];
    __weak id blockSelf = self;
    self.networkOperation.completionBlock = ^{
        id strongSelf = blockSelf;
        if (strongSelf) { // desi se da zbog onog __weak bude dealloc-ovano i zato sledi ova provera
            [strongSelf setCompleted:YES];
        }
    };
}



@end
