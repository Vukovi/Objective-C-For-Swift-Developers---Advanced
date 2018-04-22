//
//  main.m
//  Advanced Objective C - KVC & KVO
//
//  Created by Vuk Knežević on 4/22/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Foo.h"

// mora biti ASCII
// mora da pocne malim slovom
// nema whitespace-a

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        Foo *foo = [[Foo alloc]init];
        
        foo.someProperty = @"some porperty";
        foo.someString = @"some string";
        NSLog(@"%@ %@",foo.someProperty, foo.someString);
        
        [foo setSomeProperty:@"some new porerty"];
        [foo setSomeString:@"some new string"];
        NSLog(@"%@ %@",foo.someProperty, foo.someString);
        
        [foo setValue:@"bla bla" forKey:@"stringOnFoo"]; // pristupa svom propertyju stringOnFoo
        NSLog(@"%@", [foo valueForKey:@"stringOnFoo"]);
        
        [foo setValue:@"Key value putanja" forKeyPath:@"bar.stringOnBar"];
        NSLog(@"%@", [foo valueForKeyPath:@"bar.stringOnBar"]); // pristupa svom propertyju bar koji ima svoj property stringOnBar
        
        [foo.bar setStringOnBar:@"Okini observera"];
        foo.bar.stringOnBar = @"I on okida observera";
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
