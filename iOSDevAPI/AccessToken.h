//
//  AccessToken.h
//  iOSDevAPI
//
//  Created by Vasilii on 08.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessToken : NSObject

@property (nonatomic, strong) NSString *acsee_token;
@property (nonatomic, strong) NSDate *eexpirationDate;
@property (nonatomic, strong) NSString *userID;

@end
