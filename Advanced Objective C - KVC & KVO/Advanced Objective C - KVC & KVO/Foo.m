//
//  Foo.m
//  Advanced Objective C - KVC & KVO
//
//  Created by Vuk Knežević on 4/22/18.
//  Copyright © 2018 Vuk Knežević. All rights reserved.
//

#import "Foo.h"

@interface Foo() // private interface !!!!!!
{
    NSString *_someString; // private property u kom cemo cuvati rezultat gettera -> (NSString*)someString; i settera -> (void)setSomeString:(NSString*)someString;
}
@end





@implementation Foo

//KEY VALUE CODING
// ovde se zbog pristupa pomocu KV Accessora, private propertyju, tj pomocu ovog gettera i settera dogadja key-value coding
- (NSString *)someString{
    return _someString;
}

- (void)setSomeString:(NSString *)someString {
    _someString = someString;
}


// KEY VALUE OBSERVING
-(id)init{
    if (self = [super init]) {
        self.bar = [Bar new];
        // posmatraj objekat bar
        [self.bar addObserver:self forKeyPath:@"stringOnBar" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)dealloc {
    [self.bar removeObserver:self forKeyPath:@"stringOnBar"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    // u NSDictionary-ju change bice ono sto smo postavili da gledamo, u ovom slucaju
    // NSKeyValueObservingOptionNew iz init metode
    if (object == self.bar) { // ovo ovd nema smisla jer samo taj objekat gledamo, ali kad ih ima vise onda moramo opredeliti koji cemo gledati
        if ([keyPath isEqualToString:@"stringOnBar"]) {
            NSLog(@"String on bar got changed!");
            return; // stavljam ovo u slucaju koriscenja super klase kao handlera posmatranog objekta, a ona, tj super klasa nije izhendlala posmatrani objekat
        }
    }
//    ovo ispod bih napisao ako hocu da posmatrani objekat hendla super klasa
//    [super observeValueForKeyPath:<#keyPath#> ofObject:<#object#> change:<#change#> context:<#context#>]
}


//MANUAL KVO NOTIFICATION
// postavi observer tako da prati sve kljucne reci koje i u super klasama i ostalim klasama, prate upotrebu reci -birthDate-, da bi se u Foo izmenio property AGE
+(NSSet*) keyPathsForValuesAffectingValueForKey: (NSString*)key {
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"age"]) {
        NSArray *affectionKeys = @[@"birthDate"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectionKeys];
    }
    return keyPaths;
}

// ovo ce iskljuciti automatske notifikacije za birthDate property
+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    if ([key isEqualToString:@"birthDate"]) {
        return NO;
    }
    return YES;
}
// zato ces morati manualno da obavestis sistem o promenama na propertyjima
-(void)setBirthDate:(NSDate *)birthDate {
    [self willChangeValueForKey:@"birthDate"];
    _birthDate = birthDate;
    [self didChangeValueForKey:@"birthDate"];
}

-(NSInteger)age {
    return [self.birthDate timeIntervalSinceNow];
}

// KVO rizici:
// pazi se nekih pratecih efekata observera
// hendluj nil i druge neobicne vrednosti
// ne korisit accessore (tj dot notaciju) u init i dealloc metodama


@end
