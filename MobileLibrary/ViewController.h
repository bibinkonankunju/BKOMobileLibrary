//
//  ViewController.h
//  MobileLibrary
//
//  Created by BIBIN K ONANKUNJU on 11/11/16.
//  Copyright © 2016 BIBIN K ONANKUNJU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface ViewController : UIViewController<FBSDKLoginButtonDelegate,FBSDKLoginTooltipViewDelegate,FBSDKGraphRequestConnectionDelegate>
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

- (void)signIn;

- (void)FacebooksignIn:(NSString *)email screenName:(NSString *)screenName firstName:(NSString *)firstName lastName:(NSString *)lastName profileImage:(NSString *)profileImage;

- (void)createAccount;

- (void)FacebookInsertFriend:(NSString *)ID Name:(NSString *)Name AccountID:(NSString *)AccountID;


@end
