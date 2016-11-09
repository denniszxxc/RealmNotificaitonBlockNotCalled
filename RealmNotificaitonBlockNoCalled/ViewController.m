//
//  ViewController.m
//  RealmNotificaitonBlockNoCalled
//
//  Created by Dennis on 9/11/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "Human.h"
#import "Chicken.h"
#import "Alien.h"

@interface ViewController ()

@property (strong, nonatomic) RLMNotificationToken *humanChangeToken;
@property (strong, nonatomic) RLMNotificationToken *chickenChangeToken;
@property (strong, nonatomic) RLMNotificationToken *alienChangeToken;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Observer Human Count
    self.humanChangeToken = [[Human allObjects] addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        NSLog(@"🙆Human Notification Block: Human Count= %ld", results.count);
    }];
    
    // Observer Chicken Count
    self.chickenChangeToken = [[Chicken allObjects] addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        NSLog(@"🐔Chicken Notification Block: Chicken Count= %ld", results.count);
    }];
    
    // Observe Alien Count
    self.alienChangeToken = [[Alien allObjects] addNotificationBlock:^(RLMResults * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        NSLog(@"👽Alien Notification Block: Alien Count= %ld", results.count);
    }];

}


- (void)humanAddRemoveAction {
    Human *human = [[Human alloc] init];
    
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm transactionWithBlock:^{
        NSLog(@"Add a Human🙆");
        [defaultRealm addObject:human];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [defaultRealm transactionWithBlock:^{
            NSLog(@"Delete a Human🙆");
            [defaultRealm deleteObject:human];
        }];
    });
}

- (void)chickenAddRemoveAction {
    Chicken *chick = [[Chicken alloc] init];
    
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm transactionWithBlock:^{
        NSLog(@"Add a chicken🐔");
        [defaultRealm addObject:chick];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [defaultRealm transactionWithBlock:^{
            NSLog(@"Delete a chicken🐔");
            [defaultRealm deleteObject:chick];
        }];
    });
}

- (void)alienAddRemoveAction {
    Alien *alien = [[Alien alloc] init];
    
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm transactionWithBlock:^{
        NSLog(@"Add an Alien👽");
        [defaultRealm addObject:alien];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [defaultRealm transactionWithBlock:^{
            NSLog(@"Delete an Alien👽");
            [defaultRealm deleteObject:alien];
        }];
    });
}


- (IBAction)didClickHumanTest:(id)sender {
    [self humanAddRemoveAction];
}

- (IBAction)didClickChickTest:(id)sender {
    [self chickenAddRemoveAction];
}

- (IBAction)didClickHumanChickenTest:(id)sender {
    [self humanAddRemoveAction];
    [self chickenAddRemoveAction];
}

- (IBAction)didClickHumanChickenAlienTest:(id)sender {
    [self humanAddRemoveAction];
    [self chickenAddRemoveAction];
    [self alienAddRemoveAction];
}
@end
