//
//  SignupViewController.m
//  MobileLibrary
//
//  Created by BIBIN K ONANKUNJU on 09/12/16.
//  Copyright © 2016 BIBIN K ONANKUNJU. All rights reserved.
//

#import "SignupViewController.h"
#import "ViewController.h"

@implementation SignupViewController
float dwidth,dheight;
UITextField *textName, *textEmail, *textPwd, *textPwd1, *textMobile;
UIButton *cancelBtn, *loginBtn, *regiBtn;
UILabel *appheadlbl;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"loginback.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //self.view.backgroundColor = [UIColor orangeColor];
    
    CGRect screensize = [[UIScreen mainScreen]bounds];
    dwidth = screensize.size.width;
    dheight = screensize.size.height;
    
    UILabel *applbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, dwidth, 50)];
    applbl.text = @"Online Library App";
    applbl.textAlignment = NSTextAlignmentCenter;
    applbl.backgroundColor = [UIColor lightTextColor];
    applbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [self.view addSubview:applbl];
    
    
    appheadlbl = [[UILabel alloc]initWithFrame:CGRectMake(0, dheight/3 - 75, dwidth, 60) ];
    appheadlbl.text=@"New User Registration";
    appheadlbl.textAlignment = NSTextAlignmentCenter;
    appheadlbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [self.view addSubview:appheadlbl];
    
    textName=[[UITextField alloc]initWithFrame:CGRectMake(dwidth/4, dheight/3, dwidth/2, 25)];
    textName.placeholder=@"Your Name";
    textName.autocorrectionType = UITextAutocorrectionTypeNo;
    textName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textName.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textName];
    
    textEmail=[[UITextField alloc]initWithFrame:CGRectMake(dwidth/4, dheight/3 + 30, dwidth/2, 25)];
    textEmail.placeholder=@"Your Email";
    textEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    textEmail.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textEmail.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textEmail];
    
    textPwd=[[UITextField alloc]initWithFrame:CGRectMake(dwidth/4, dheight/3 + 60, dwidth/2, 25)];
    textPwd.placeholder=@"Password";
    textPwd.autocorrectionType = UITextAutocorrectionTypeNo;
    textPwd.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textPwd.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textPwd];
    
    textPwd1=[[UITextField alloc]initWithFrame:CGRectMake(dwidth/4, dheight/3 + 90, dwidth/2, 25)];
    textPwd1.placeholder=@"Confirm Password";
    textPwd1.autocorrectionType = UITextAutocorrectionTypeNo;
    textPwd1.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textPwd1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textPwd1];
    
    textMobile=[[UITextField alloc]initWithFrame:CGRectMake(dwidth/4, dheight/3 + 120, dwidth/2, 25)];
    textMobile.placeholder=@"Your Mobile Number";
    textMobile.autocorrectionType = UITextAutocorrectionTypeNo;
    textMobile.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textMobile.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textMobile];
    
    regiBtn = [[UIButton alloc]initWithFrame:CGRectMake(dwidth/4, dheight/3 + 150, dwidth/4-2, 25)];
    [regiBtn setTitle:@"SignUp" forState:UIControlStateNormal];
    [regiBtn addTarget:self action:@selector(UserReg_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:regiBtn];
    
    cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(dwidth/2 + 4, dheight/3+150, dwidth/4 - 2, 25)];
    [cancelBtn setTitle:@"Cancel" forState:(UIControlStateNormal)];
    [cancelBtn addTarget:self action:@selector(Cancel_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:cancelBtn];
    
    loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(dwidth/4, dheight/3 + 180, dwidth/2, 25)];
    [loginBtn setTitle:@"Already Registered!" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(Login_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:loginBtn];
    
}

-(IBAction)UserReg_BtnClk:(id)sender{
//    UIAlertController *alertreg = [UIAlertController alertControllerWithTitle:@"Registration" message:@"Success!" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//    [alertreg addAction:ok];
//    [self presentViewController:alertreg animated:YES completion:nil];
    
    ViewController *suvc = [[ViewController alloc]init];
    [self presentViewController:suvc animated:YES completion:nil];
}

-(IBAction)Cancel_BtnClk:(id)sender{
    textName.text = @"";
    textMobile.text = @"";
    textPwd.text = @"";
    textPwd1.text = @"";
    textEmail.text = @"";
}

-(IBAction)Login_BtnClk:(id)sender{
    ViewController *suvc = [[ViewController alloc]init];
    [self presentViewController:suvc animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
