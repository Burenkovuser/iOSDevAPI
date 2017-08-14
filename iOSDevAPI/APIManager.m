//
//  APIManager.m
//  iOSDevAPI
//
//  Created by Vasilii on 09.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "APIManager.h"

//API
#import "AccessToken.h"
//Controller
#import "LoginViewController.h"
//Libs
#import <AFNetworking/AFNetworking.h>
//Model
#import "User.h"

@interface APIManager ()
@property (strong, nonatomic) AccessToken *token;
@end

@implementation APIManager

+ (APIManager *)sharedManager {
    static APIManager *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[APIManager alloc] init];
    });
    return manager;
}

#pragma mark - ---=== AUTH ===---

- (void)authorizeUser:(void(^)(User *user))success
              failure:(void(^)(NSError *error))failure
{
    if (!self.token) {
        LoginViewController *vc = [[LoginViewController alloc] initWithCompletionBlock:^(AccessToken *token) {
            
            self.token = token;
            
            [self getUserWithUserID:token.userID
                            success:^(User *user) {
                                if (user) {
                                    if (success) success(user);
                                } else {
                                    NSError *error = [NSError errorWithDomain:@"User is nil" code:001 userInfo:nil];
                                    failure(error);
                                }
                            }
                            failure:^(NSError *error) {
                                if (failure) failure(error);
                            }];
        }];
        
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        UIViewController* mainVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
        [mainVC presentViewController:nc animated:YES completion:nil];
    }
}

#pragma mark - ---=== GET METHODS ===---

#pragma mark - User
- (void)getUserWithUserID:(NSString *)userID
                  success:(void(^)(User *user))success
                  failure:(void(^)(NSError *error))failure
{
    NSDictionary *parameters = @{
                                 @"user_ids"  : userID,
                                 @"fields"    : @"photo_50",
                                 @"name_case" : @"nom",
                                 @"v"         : @"5.52"
                                 };
    
    [[AFHTTPSessionManager manager]
     GET:@"https://api.vk.com/method/users.get"
     parameters:parameters
     progress:nil
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSArray *responseArray = responseObject[@"response"];
         NSDictionary *params = [responseArray firstObject];
         User *user = [[User alloc] initWithResponseObject:params];
         if (success) success(user);
     }
     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         if (failure) failure(error);
     }];
}

@end
