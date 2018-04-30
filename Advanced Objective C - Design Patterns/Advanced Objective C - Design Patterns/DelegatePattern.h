//
//  DelegatePattern.h
//  Advanced Objective C - Design Patterns
//
//  Created by Vuk Knežević on 4/30/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DelegationClass;

@protocol Delegate <NSObject>
-(void)completed:(DelegationClass *)command;
@end

@interface DelegatePattern : NSObject
@property (weak, nonatomic) id<Delegate> delegate;
@end
