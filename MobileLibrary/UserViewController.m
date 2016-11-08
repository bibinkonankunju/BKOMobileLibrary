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

    [self loadContents];
    
}

-(void)loadContents{
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Home", @"Books", @"Profile", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor whiteColor];
    [self.view addSubview:segmentedControl];
    
    CGRect segframe=segmentedControl.frame;
    segframe.size.width = sdwidth * 0.8;
    segframe.origin.x = sdwidth * 0.1;
    segframe.origin.y = 50;
    segmentedControl.frame=segframe;
    
    UIButton *lgoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(sdwidth * 0.2, sdheight - 30, sdwidth * 0.6, 30)];
    [lgoutBtn setTitle:@"LogOut" forState:UIControlStateNormal];
    [lgoutBtn addTarget:self action:@selector(LogOut_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:lgoutBtn];
    
}

-(void)MySegmentControlAction : (UISegmentedControl*) sender
{
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            [self MainView];
            break;
        case 1:
            [self BookView];
            break;
        case 2:
            [self ProfileView];
             break;
            
        default:
            break;
            
    }
}

-(void) MainView{
    
}

-(void) BookView{
    
}

-(void) ProfileView{
    
}

- (IBAction)LogOut_BtnClk:(id)sender {
    LoginViewController *uvc = [[LoginViewController alloc]init];
    [self presentViewController:uvc animated:YES completion:nil];

}


@end


