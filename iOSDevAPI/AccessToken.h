//
//  AccessToken.h
//  iOSDevAPI
//
//  Created by Vasilii on 08.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessToken : NSObject

@property (strong, nonatomic) NSString *access_token;
@property (strong, nonatomic) NSDate *expires_in;
@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSString *email;

- (instancetype)initWithComponents:(NSDictionary *)components;

@end
