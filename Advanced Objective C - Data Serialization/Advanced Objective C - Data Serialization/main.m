//
//  main.m
//  Advanced Objective C - Data Serialization
//
//  Created by Vuk Knežević on 4/30/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSCoderClass.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSCoderClass *obj = [NSCoderClass new];
        [NSKeyedArchiver archiveRootObject:obj toFile:@"NSCoderClass.dat"];
        
        NSCoderClass *deserializedObj = [NSKeyedUnarchiver unarchiveObjectWithFile:@"NSCoderClass.dat"];
        assert(deserializedObj);
        
        // koriscenje pliste kod nscoder-a
        NSDictionary *data = @{@"NSCoderClass" : obj};
        [data writeToFile:@"NSCoderClass.plist" atomically:YES];
        
        NSDictionary *deserializedData = [NSDictionary dictionaryWithContentsOfFile:@"NSCoderClass.plist"];
        assert(deserializedData);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
