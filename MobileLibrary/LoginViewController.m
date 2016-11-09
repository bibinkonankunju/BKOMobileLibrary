//
//  LoginViewController.m
//  MobileLibrary
//
//  Created by BIBIN K ONANKUNJU on 07/11/16.
//  Copyright © 2016 BIBIN K ONANKUNJU. All rights reserved.
//

#import "LoginViewController.h"
#import "UserViewController.h"

@implementation LoginViewController
float swidth,sheight;
UITextField *textUser,*textPwd;
UIButton *logBtn, *cancelBtn, *regBtn;
UILabel *headlbl;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    CGRect screensize = [[UIScreen mainScreen]bounds];
    swidth = screensize.size.width;
    sheight = screensize.size.height;
    
    UILabel *applbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, swidth, 50)];
    applbl.text = @"Online Library App";
    applbl.textAlignment = NSTextAlignmentCenter;
    applbl.backgroundColor = [UIColor lightTextColor];
    applbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [self.view addSubview:applbl];

    
    headlbl = [[UILabel alloc]initWithFrame:CGRectMake(swidth/3-15, sheight/3 - 75, swidth/2, 60) ];
    headlbl.text=@"User Login";
    headlbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [self.view addSubview:headlbl];
    
    
    textUser=[[UITextField alloc]init];
    CGRect frm=textUser.frame;
    frm.size.width=swidth/3;
    frm.size.height=25;
    frm.origin.x=swidth/3;
    frm.origin.y=sheight/3;
    textUser.frame=frm;
    textUser.placeholder=@"User Name";
    textUser.autocorrectionType = UITextAutocorrectionTypeNo;
    textUser.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textUser.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textUser];
    
    textPwd = [[UITextField alloc]init];
    CGRect pfrm = textPwd.frame;
    pfrm.origin.x = swidth/3;
    pfrm.origin.y = sheight/3+35;
    pfrm.size.width = swidth/3;
    pfrm.size.height = 25;
    textPwd.frame = pfrm;
    textPwd.placeholder=@"Password";
    textPwd.secureTextEntry=YES;
    textPwd.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:textPwd];
    
    logBtn = [[UIButton alloc]initWithFrame:CGRectMake(swidth/3, sheight/3 + 70, swidth/6-2, 25)];
    [logBtn setTitle:@"LogIn" forState:UIControlStateNormal];
    [logBtn addTarget:self action:@selector(UserLogin_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:logBtn];
    
    cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(swidth/3+swidth/6+4, sheight/3+70, swidth/6-2, 25)];
    [cancelBtn setTitle:@"Cancel" forState:(UIControlStateNormal)];
    [cancelBtn addTarget:self action:@selector(Cancel_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:cancelBtn];
    
    regBtn = [[UIButton alloc]initWithFrame:CGRectMake(swidth/3+swidth/6+4, sheight/3 + 100, swidth/6 - 2, 25)];
    [regBtn setTitle:@"SignUp" forState:UIControlStateNormal];
    [regBtn addTarget:self action:@selector(Reg_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:regBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)Reg_BtnClk:(id)sender{
    UIAlertController *alertreg = [UIAlertController alertControllerWithTitle:@"Registration" message:@"Register Now" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertreg addAction:ok];
    [self presentViewController:alertreg animated:YES completion:nil];
    
    //    RegViewController *rvc = [[RegViewController alloc]init];
    //    [self presentViewController:rvc animated:YES completion:nil];
}
- (IBAction)UserLogin_BtnClk:(id)sender {
    //    NSString *usrNm = textUser.text;
    //    NSString *usrpwd =textPwd.text;
    
    UserViewController *uvc = [[UserViewController alloc]init];
    [self presentViewController:uvc animated:YES completion:nil];
    
}
- (IBAction)Cancel_BtnClk:(id)sender {
    textUser.text = @"";
    textPwd.text = @"";
}


@end
