//
//  Primefinder.m
//  Advanced Objective C - Threads
//
//  Created by Vuk Knežević on 4/23/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "Primefinder.h"

@interface Primefinder()
@property NSInteger maxNumber;
@property (nonatomic) BOOL finished;
@end

@implementation Primefinder

@dynamic elapsedTime;

-(id)initWithMaxNumber:(NSInteger)inMaxNumber{
    if (self = [super init]) {
        _maxNumber = inMaxNumber;
        _primes = [@[] mutableCopy];
        _completed = 0;
        _primeQueue = [[NSOperationQueue alloc]init];
    }
    return self;
}

-(BOOL)isPrime:(NSInteger)number {
    for (NSInteger n = 2; n < number; ++n) {
        if ((number % n) == 0) {
            return NO;
        }
    }
    return YES;
}

-(NSTimeInterval)elapsedTime {
    return [self.endedDate timeIntervalSinceDate:self.startedDate];
}

-(void)start {
    [self setStartedDate:[NSDate date]];
    for (NSInteger n = 2; n <= self.maxNumber; ++n) {
        if ([self isPrime:n]) {
            [self.primes addObject:[NSNumber numberWithInteger:n]];
        }
    }
    [self setEndedDate:[NSDate date]];
    self.finished = YES;
}

-(void)startWithGCD {
    
    dispatch_queue_t mojDispecRed = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    [self setStartedDate:[NSDate date]];
    for (NSInteger n = 2; n <= self.maxNumber; ++n) {
        dispatch_async(mojDispecRed, ^{
            if ([self isPrime:n]) {
                @synchronized(self){ // zbog thread safty-ja
                    [self.primes addObject:[NSNumber numberWithInteger:n]];
                }
            }
            @synchronized(self){ // zbog thread safty-ja
                self.completed++;
                if (self.completed >= self.maxNumber-1) {
                    [self setEndedDate:[NSDate date]];
                    self.finished = YES;
                }
            }
        });
    }
    
}


-(void)startWithGCDGroup {
    
    dispatch_queue_t mojDispecRed = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t mojaDispecGrupa = dispatch_group_create();
    
    [self setStartedDate:[NSDate date]];
    for (NSInteger n = 2; n <= self.maxNumber; ++n) {
        dispatch_block_t isPrime = ^{
            if ([self isPrime:n]) {
                @synchronized(self){
                    [self.primes addObject:[NSNumber numberWithInteger:n]];
                }
            }
        };
        dispatch_group_async(mojaDispecGrupa, mojDispecRed, isPrime);
    }
    // on ce da ceka na izvrsenje grupe
    dispatch_group_wait(mojaDispecGrupa, DISPATCH_TIME_FOREVER); // ovo sa FOREVER moze biti opasno jer moze u nekim slucajevim da se desi da se nikad ne napusti grupa

    [self setEndedDate:[NSDate date]];
    self.finished = YES;

}

-(void)startWithNSOperation {
    [self setStartedDate:[NSDate date]];
    for (NSInteger n = 2; n <= self.maxNumber; ++n) {
        //napravi operacioni blok koji treba da izvrsi neki zadatak
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            if ([self isPrime:n]) {
                @synchronized(self){
                    [self.primes addObject:[NSNumber numberWithInteger:n]];
                }
            }
        }];
        //kad se blok zavrsi treba da uradi sledece
        operation.completionBlock = ^{
            @synchronized(self){
                [self setEndedDate:[NSDate date]];
            }
        };
        //dodaj operaciju u moj queue
        [self.primeQueue addOperation:operation];
    }
}

// kad god imam situaciju da se neki podatak azurira ili mu se postavlja neka vrednost, treba iskoristiti sinhronizovaciju
// ukoliko je ne bih iskoristio, @synchronized, desilo bi se da u istom trenutku jedan thread upisuje nove vrednosti podataka, a drugi thread ih cita, jer pristupaju istoj memorijskoj lokaciji, tako da bih dobio nevalidne podatke
// za slicnu namenu mogu koristiti NSThreadLock, ali @synchronized je moderan nacin objectiv-c

-(BOOL)finished {
    return ([self.primeQueue operationCount] == 0);
}

@end
