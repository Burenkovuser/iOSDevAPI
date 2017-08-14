//
//  LoginViewController.h
//  iOSDevAPI
//
//  Created by Vasilii on 14.08.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

//API
#import "AccessToken.h"

@class AccessToken;

typedef void(^LoginCompletionBlock)(AccessToken *token);

@interface LoginViewController : UIViewController

- (id)initWithCompletionBlock:(void(^)(AccessToken *token))completion;

@end
