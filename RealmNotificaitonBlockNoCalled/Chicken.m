//
//  Chicken.m
//  CXShopediaFileIOPOC
//
//  Created by Dennis on 9/11/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "Chicken.h"

#define chickenSpecies @[@"Ancona Chickens",@"Andalusian Chickens",@"Appenzeller Barthuhner Chickens",@"Appenzeller Spitzhauben Chickens",@"Araucana Chickens",@"Rumpless Araucana Chickens",@"Asian Hard Feather",@"Asil (Aseel) Chickens" ]

@implementation Chicken

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.classificaion = @"bird";
        self.sex = arc4random_uniform(2) == 1 ? @"male" : @"female";
        self.spices = chickenSpecies[arc4random_uniform(8)];
    }
    return self;
}

@end
