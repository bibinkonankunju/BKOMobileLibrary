//
//  ViewController.m
//  MobileLibrary
//
//  Created by BIBIN K ONANKUNJU on 11/11/16.
//  Copyright © 2016 BIBIN K ONANKUNJU. All rights reserved.
//

#import "ViewController.h"
#import "UserViewController.h"
#import "SignupViewController.h"
#import "ResetPasswordViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface ViewController ()

@end

@implementation ViewController
float swidth,sheight;
UITextField *textUser,*textPswd;
UIButton *logBtn, *forgotBtn, *regBtn;
UILabel *headlbl;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"loginback.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //self.view.backgroundColor = [UIColor orangeColor];
    
    CGRect screensize = [[UIScreen mainScreen]bounds];
    swidth = screensize.size.width;
    sheight = screensize.size.height;
    
    UILabel *applbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, swidth, 50)];
    applbl.text = @"Online Library App";
    applbl.textAlignment = NSTextAlignmentCenter;
    applbl.backgroundColor = [UIColor lightTextColor];
    applbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [self.view addSubview:applbl];
    
    
    headlbl = [[UILabel alloc]initWithFrame:CGRectMake(0, sheight/3 - 75, swidth, 60) ];
    headlbl.text=@"User Login";
    headlbl.textAlignment = NSTextAlignmentCenter;
    headlbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [self.view addSubview:headlbl];
    
    
    textUser=[[UITextField alloc]initWithFrame:CGRectMake(swidth/3, sheight/3, swidth/3, 25)];
    textUser.placeholder=@"User Name";
    textUser.autocorrectionType = UITextAutocorrectionTypeNo;
    textUser.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textUser.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textUser];
    
    textPswd = [[UITextField alloc]initWithFrame:CGRectMake(swidth/3, sheight/3+35, swidth/3, 25) ];
    textPswd.placeholder=@"Password";
    textPswd.secureTextEntry=YES;
    textPswd.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textPswd];
    
    logBtn = [[UIButton alloc]initWithFrame:CGRectMake(swidth/3, sheight/3 + 70, swidth/6-2, 25)];
    [logBtn setTitle:@"LogIn" forState:UIControlStateNormal];
    [logBtn addTarget:self action:@selector(UserLogin_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:logBtn];
    
    forgotBtn = [[UIButton alloc]initWithFrame:CGRectMake(swidth/3+swidth/6+4, sheight/3+70, swidth/6-2, 25)];
    [forgotBtn setTitle:@"Forgot?" forState:(UIControlStateNormal)];
    [forgotBtn addTarget:self action:@selector(Forgot_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:forgotBtn];
    
    regBtn = [[UIButton alloc]initWithFrame:CGRectMake(swidth/3, sheight/3 + 100, swidth/3, 25)];
    [regBtn setTitle:@"SignUp?" forState:UIControlStateNormal];
    [regBtn addTarget:self action:@selector(Reg_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:regBtn];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] initWithFrame:CGRectMake(swidth/3, sheight/3 + 200, swidth/3, 25)];
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.loginButton.delegate = self;
    [self.view addSubview:loginButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Reg_BtnClk:(id)sender{
    SignupViewController *suvc = [[SignupViewController alloc]init];
    [self presentViewController:suvc animated:YES completion:nil];
}
- (IBAction)UserLogin_BtnClk:(id)sender {
    //    NSString *usrNm = textUser.text;
    //    NSString *usrpwd =textPwd.text;
    
    [self GotoUserView];
    
}

-(void)GotoUserView{
    UserViewController *uvc = [[UserViewController alloc]init];
    [self presentViewController:uvc animated:YES completion:nil];
}

- (IBAction)Forgot_BtnClk:(id)sender {
    ResetPasswordViewController *rpvc = [[ResetPasswordViewController alloc]init];
    [self presentViewController:rpvc animated:YES completion:nil];
}
-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    NSLog(@"logout");
}
-(BOOL)loginButtonWillLogin:(FBSDKLoginButton *)loginButton{
    NSLog(@"in");
    return YES;
}
-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    NSLog(@"mmmm");
}

//-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
//{
//    //[self loginClicked];
//    [FBSDKAccessToken setCurrentAccessToken:result.token];
//    // if(![FBSDKAccessToken currentAccessToken])
//    //[User clearAll];
//    
//    
//    //[FBSDKAccessToken setCurrentAccessToken:nil];
//    if(result != nil && result.token != nil)
//    {
//        
//        //  login.loginBehavior = FBSDKLoginBehaviorWeb;
//        if (error) {
//            NSLog(@"Process error");
//        } else if (result.isCancelled) {
//            NSLog(@"Cancelled");
//        } else {
//            NSLog(@"Logged in");
//            FBSDKAccessToken *token = result.token;//[FBSDKAccessToken currentAccessToken];
//            [FBSDKAccessToken setCurrentAccessToken:token];
//            if ([FBSDKAccessToken currentAccessToken] != nil)
//            {
//                
//                
//                FBSDKGraphRequest *requestMe = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, first_name, last_name, picture.type(large), email"}];
//                
//                FBSDKGraphRequestConnection *connection = [[FBSDKGraphRequestConnection alloc] init];
//                
//                
//                [connection addRequest:requestMe completionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//                    
//                    if(result)
//                    {
//                        NSString *email;
//                        NSString *name;
//                        NSString *lastName, *firstName;
//                        NSString *userid;
//                        //   NSData  *data;
//                        NSString *pictureURL;
//                        email = @"bibin.onankunju@gmail.com";
//                        if ([result objectForKey:@"email"]) {
//                            email = [result objectForKey:@"email"];
//                            
//                            // [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"useremail"];
//                            
//                        }
//                        if ([result objectForKey:@"first_name"]) {
//                            
//                            // NSLog(@"First Name : %@",[result objectForKey:@"first_name"]);
//                            firstName = [result objectForKey:@"first_name"];
//                            // [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"userNameLogin"];
//                            
//                        }
//                        if ([result objectForKey:@"last_name"]) {
//                            
//                            // NSLog(@"First Name : %@",[result objectForKey:@"first_name"]);
//                            lastName = [result objectForKey:@"last_name"];
//                            // [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"userNameLogin"];
//                            
//                        }
//                        
//                        if ([result objectForKey:@"name"]) {
//                            
//                            // NSLog(@"First Name : %@",[result objectForKey:@"first_name"]);
//                            name = [result objectForKey:@"name"];
//                            // [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"userNameLogin"];
//                            
//                        }
//                        
//                        if ([result objectForKey:@"id"])
//                        {
//                            
//                            // NSLog(@"User id : %@",[result objectForKey:@"id"]);
//                            userid = [result objectForKey:@"id"];
//                            pictureURL = userid;
//                        }
//                        
////                        
////                        SignInViewController *siginV = self;
////                        
////                        [siginV FacebooksignIn:email screenName:name firstName:firstName lastName:lastName profileImage:pictureURL];
//                    }
//                    
//                    // [self callfbloginwebservice];
//                    
//                }];
//                [connection start];
//                
//                //}
//                
//                // }];
//                
//            }
//        }
//        
//        
//        
//    }
//    else
//    {
//        NSLog(@"Logged In");
//    }
//    
//}
//

@end
