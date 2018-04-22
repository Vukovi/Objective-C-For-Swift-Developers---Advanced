//
//  Foo.h
//  Advanced Objective C - KVC & KVO
//
//  Created by Vuk Knežević on 4/22/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar.h"

@interface Foo : NSObject
//KVC
@property NSString *someProperty;
-(NSString*)someString; // getter
-(void)setSomeString:(NSString*)someString; //setter
//KVO
@property (strong, nonatomic) Bar *bar;
@property (strong, nonatomic) NSString *stringOnFoo;
//Manual KVO notifikacije
@property (strong, nonatomic) NSDate *birthDate;
@property (readonly) NSInteger age;
@end
