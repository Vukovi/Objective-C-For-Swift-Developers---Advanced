//
//  main.m
//  Advanced Objective C - Threads
//
//  Created by Vuk Knežević on 4/23/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// hijerarhija threadinga
// 1) NSOperation & NSOperationQueue
// 2) dispatch_*  C-ovski API koji korisit GCD za runtime
// 3) GCD

// Funkcije GCD-a
// dispatch_get_global_queue  -> hvata globalni dispatch queue koji vec postoji po defaultu
// dispatch_get_main_queue  -> hvata main dispatch queue koji vec postoji po defaultu
// dispatch_queue_create  -> kreira novi queue
// dispatch_get_current_queue  -> hvata current dispatch queue koji trenutno radi
// dispatch_main -> Salje kod na izvrsenje na glavnom tj main threadu

// dispatchovanje
// dispatch_async -> salje izvrsenje na pozadinski thread i odmah oslobadja kod
// dispatch_sync -> salje izvrsenje na trenutni thread i ceka dok se ne zavrsi da bi oslobodio kod
// dispatch_after -> salje izvrsenje na odredjeni thread posle zadatog vremena
// dispatch_apply -> salje ivrsenja, kao niz, na pozadinske threadove
// dispatch_once -> salje jedinsteveno izvrsenje, analogija sa singletonom, na nivou aplikacije

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
