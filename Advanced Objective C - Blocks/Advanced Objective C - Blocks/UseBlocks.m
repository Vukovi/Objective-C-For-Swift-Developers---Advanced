//
//  UseBlocks.m
//  Advanced Objective C - Blocks
//
//  Created by Vuk Knežević on 4/12/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "UseBlocks.h"

@implementation UseBlocks

// ovaj blok je prakticno C-ovska funkcija bez return type-a
// koja u sebi ima paramtera koji je blok, a on ima return type NSComparisonResult, zove se theBlock i ima parametar NSString
void useBlock(NSComparisonResult (^theBlock) (NSString *)) {
    if (NSOrderedSame == theBlock(@"foo")) {
        NSLog(@"Uradi nesto");
    } else {
        NSLog(@"Uradi nesto drugo");
    }
}

// drugi parametar je blok u klasicnoj objective C funkciji
-(NSMutableArray*)filterArray:(NSArray *)inArray withBlock:(BOOL (^)(NSInteger))block {
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for (NSNumber *number in inArray){
        if (block([number integerValue])) {
            [result addObject:number];
        }
    }
    return result;
}


-(void)mutatingBlock {
    __block NSString *result; // __block se koristi za property-je koji ce biti menjanji unutar bloka
    void (^mutatorBlock)(void) = ^{
        result = @"neka nova vrednost";
    };
    [self mutateMe:mutatorBlock];
}

-(void)mutateMe: (void (^)(void))mutator{
    mutator();//zagrade znace - izvrsi kod
}

@end
