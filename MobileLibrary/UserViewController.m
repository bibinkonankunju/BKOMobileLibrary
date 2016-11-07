//
//  UserViewController.m
//  MobileLibrary
//
//  Created by BIBIN K ONANKUNJU on 07/11/16.
//  Copyright © 2016 BIBIN K ONANKUNJU. All rights reserved.
//

#import "UserViewController.h"
#import "LoginViewController.h"

float sdwidth,sdheight;

@implementation UserViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect screensize = [[UIScreen mainScreen]bounds];
    sdwidth = screensize.size.width;
    sdheight = screensize.size.height;

    self.view.backgroundColor = [UIColor lightGrayColor];


    UIButton *lgoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(sdwidth/3+sdwidth/6+4, sdheight/3 + 100, sdwidth/6 - 2, 25)];
    [lgoutBtn setTitle:@"LogOut" forState:UIControlStateNormal];
    [lgoutBtn addTarget:self action:@selector(LogOut_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:lgoutBtn];
}

- (IBAction)LogOut_BtnClk:(id)sender {
    LoginViewController *uvc = [[LoginViewController alloc]init];
    [self presentViewController:uvc animated:YES completion:nil];

}


@end


