//
//  AccessToken.m
//  iOSDevAPI
//
//  Created by Vasilii on 08.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "AccessToken.h"

@implementation AccessToken

- (instancetype)initWithComponents:(NSDictionary *)components {
    self = [super init];
    if (self) {
        
        _access_token = components[@"access_token"];
        _expires_in = [NSDate dateWithTimeIntervalSinceNow:[components[@"expires_in"] doubleValue]];
        _userID = components[@"user_id"];
        
        if (components[@"email"]) {
            _email = components[@"email"];
        }
    }
    return self;
}

@end
