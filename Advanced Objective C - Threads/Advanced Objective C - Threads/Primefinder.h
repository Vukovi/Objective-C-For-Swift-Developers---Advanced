//
//  Primefinder.h
//  Advanced Objective C - Threads
//
//  Created by Vuk Knežević on 4/23/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Primefinder : NSObject
@property (strong, nonatomic) NSMutableArray *primes;
@property (nonatomic) NSTimeInterval elapsedTime;
@property (nonatomic, strong) NSDate *startedDate;
@property (nonatomic, strong) NSDate *endedDate;
@property (nonatomic) NSInteger completed;
@property (nonatomic, strong) NSOperationQueue *primeQueue;
-(id)initWithMaxNumber:(NSInteger)inMaxNumber;
-(BOOL)isPrime:(NSInteger)number;
-(void)start;
-(void)startWithGCD;
-(void)startWithGCDGroup;
-(void)startWithNSOperation;
@end
