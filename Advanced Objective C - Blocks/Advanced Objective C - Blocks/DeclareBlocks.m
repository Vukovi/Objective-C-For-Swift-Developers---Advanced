//
//  DeclareBlocks.m
//  Advanced Objective C - Blocks
//
//  Created by Vuk Knežević on 4/12/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "DeclareBlocks.h"

@implementation DeclareBlocks

// 1) kreiranje bloka sa parametrima
void (^myBlock) (NSString *x) = ^(NSString *x) {
    NSLog(@"%@", x);
};

// 2) kreiranje bloka bez parametara
void (^blockWithoutParams)(void) = ^{
    NSLog(@"Nema parametar");
};

// 3) blok sa return type-om
NSMutableArray *(^blockWithReturn)(NSString *) = ^(NSString *x){
    NSMutableArray *ret = @[];
    return ret;
};

@end
