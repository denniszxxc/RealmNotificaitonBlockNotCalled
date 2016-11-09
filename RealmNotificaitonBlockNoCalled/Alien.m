//
//  Alien.m
//  RealmNotificaitonBlockNoCalled
//
//  Created by Dennis on 9/11/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "Alien.h"

@implementation Alien

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = [[NSUUID UUID] UUIDString];
    }
    return self;
}

@end
