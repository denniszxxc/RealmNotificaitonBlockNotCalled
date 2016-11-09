//
//  Human.m
//  CXShopediaFileIOPOC
//
//  Created by Dennis on 9/11/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "Human.h"

#define skinColors @[@"white", @"brown", @"black", @"yellow", @"red"]

@implementation Human

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.classificaion = @"mammals";
        self.skinColor = skinColors[arc4random_uniform(5)];
        self.sex = arc4random_uniform(2) == 1 ? @"male" : @"female";
    }
    return self;
}

@end
