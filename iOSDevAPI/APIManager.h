//
//  APIManager.h
//  iOSDevAPI
//
//  Created by Vasilii on 09.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
@class User;

@interface APIManager : NSObject

+(APIManager *) sharedManager;

#pragma mark - ---=== AUTH ===---
- (void)authorizeUser:(void(^)(User *user))success
              failure:(void(^)(NSError *error))failure;

#pragma mark - ---=== GET ===---

#pragma mark - User
- (void)getUserWithUserID:(NSString *)userID
                  success:(void(^)(User *user))success
                  failure:(void(^)(NSError *error))failure;

@end
