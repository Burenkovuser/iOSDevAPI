//
//  User.m
//  iOSDevAPI
//
//  Created by Vasilii on 09.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithResponseObject:(NSDictionary *)responseObject {
    self = [super init];
    if (self) {
        
        _first_name = responseObject[@"first_name"];
        _last_name = responseObject[@"last_name"];
        _userID = responseObject[@"id"];
        
        NSString *stringURL = responseObject[@"photo_50"];
        if (stringURL) {
            _photoURL = [NSURL URLWithString:stringURL];
        }
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%@ is deallocated", self);
}


@end
