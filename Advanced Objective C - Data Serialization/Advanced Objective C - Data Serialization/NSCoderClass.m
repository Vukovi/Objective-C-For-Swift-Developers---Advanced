//
//  NSCoderClass.m
//  Advanced Objective C - Data Serialization
//
//  Created by Vuk Knežević on 5/2/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "NSCoderClass.h"
#import "SomeClass.h"
#import "SomeAntotherClass.h"

@interface NSCoderClass()
@property SomeClass *memberVariable;
@property SomeAntotherClass *anotherVariable;
@property NSArray *someMemberArray;
@property NSNumber *aNumber;
@end

@implementation NSCoderClass

// ova metoda se poziva se klasa serijalizuje
- (void)encodeWithCoder:(NSCoder *)coder {
    if ([coder allowsKeyedCoding]) {
        [coder encodeObject: _memberVariable forKey:@"numberVariable"];
        [coder encodeObject: _anotherVariable forKey:@"anotherVariable"];
        [coder encodeObject: _someMemberArray forKey:@"someMemberArray"];
        [coder encodeObject: _aNumber forKey:@"aNumber"];
    } else {
        [coder encodeObject:_memberVariable];
        [coder encodeObject:_anotherVariable];
        [coder encodeObject:_someMemberArray];
        [coder encodeObject:_aNumber];
    }
}

// kako su property-ji pozivani u encoder metodi, istim redosledom moraju biti napisani i u decoder metodi
- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        _memberVariable = [coder decodeObjectForKey:@"numberVariable"];
        _anotherVariable = [coder decodeObjectForKey:@"anotherVariable"];
        _someMemberArray = [coder decodeObjectForKey:@"someMemberArray"];
        _aNumber = [coder decodeObjectForKey:@"aNumber"];
    } else {
        _memberVariable = [coder decodeObject];
        _anotherVariable = [coder decodeObject];
        _someMemberArray = [coder decodeObject];
        _aNumber = [coder decodeObject];
    }
    return self;
}

@end
