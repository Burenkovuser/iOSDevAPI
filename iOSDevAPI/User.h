//
//  User.h
//  iOSDevAPI
//
//  Created by Vasilii on 09.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *first_name;
@property (strong, nonatomic) NSString *last_name;
@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSURL *photoURL;


- (instancetype)initWithResponseObject:(NSDictionary *)responseObject;


@end
