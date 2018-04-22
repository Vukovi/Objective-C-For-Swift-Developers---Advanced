//
//  main.m
//  Advanced Objective C - Categories
//
//  Created by Vuk Knežević on 4/22/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NSString (Guid) // napravio sam kategoriju, tj ekstenziju NSStringa a najbitnije je da se (Guid) dodaju ove zagrade sa bilo cim unutar njih
+(id)stringWithGuid;
@end

@implementation NSString (Guid)
+(id)stringWithGuid {
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *str = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    return str;
}
@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
