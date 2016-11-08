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
UIView *homeView, *bookView, *profileView;
UITextField *searchField;

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
    segframe.size.height = 25;
    segframe.origin.x = sdwidth * 0.1;
    segframe.origin.y = 50;
    segmentedControl.frame=segframe;
    
    homeView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    bookView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    profileView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    [self.view addSubview:homeView];
    [self.view addSubview:bookView];
    [self.view addSubview:profileView];
    
    [self MainView];
    
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
    [self removeSuperViews];
    homeView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    [self.view addSubview:homeView];
}

-(void) BookView{
    [self removeSuperViews];
    bookView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    [self.view addSubview:bookView];
    
    searchField=[[UITextField alloc]initWithFrame:CGRectMake(sdwidth * 0.25, 10, sdwidth * 0.5, 30)];
    [bookView addSubview:searchField];
    
    //searchField.delegate=self;
    searchField.backgroundColor=[UIColor whiteColor];
//    UIImageView *imgSearch=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)]; // Set frame as per space required around icon
//    searchField.textColor=[UIColor whiteColor];
//    [imgSearch setImage:[UIImage imageNamed:@"search_book.png"]];
//    
//    [imgSearch setContentMode:UIViewContentModeCenter];// Set content mode centre
//    searchField.leftView=imgSearch;
    
    searchField.leftViewMode=UITextFieldViewModeAlways;
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *textAttributes =@{ NSFontAttributeName : [UIFont fontWithName:@"Avenir" size:12.f] ,NSForegroundColorAttributeName:color};
    NSAttributedString *attributedPlaceholder =[[NSAttributedString alloc] initWithString:@"Search Books" attributes:textAttributes];
    [searchField setAttributedPlaceholder:attributedPlaceholder];
    searchField.textAlignment=NSTextAlignmentLeft;
    searchField.layer.cornerRadius=5;
    searchField.layer.masksToBounds=true;
    searchField.layer.borderColor=[UIColor whiteColor].CGColor;
    searchField.backgroundColor=[UIColor clearColor];
    searchField.layer.borderWidth=1;
    searchField.tintColor=[UIColor whiteColor];
    [searchField setFont:[UIFont fontWithName:@"Avenir" size:14.f]];
    [searchField setKeyboardAppearance: UIKeyboardAppearanceAlert];
    searchField.returnKeyType = UIReturnKeyDone;
}

-(void) ProfileView{
    [self removeSuperViews];
    profileView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    [self.view addSubview:profileView];
}

-(void) removeSuperViews
{
    [homeView removeFromSuperview];
    [bookView removeFromSuperview];
    [profileView removeFromSuperview];
}

- (IBAction)LogOut_BtnClk:(id)sender {
    LoginViewController *uvc = [[LoginViewController alloc]init];
    [self presentViewController:uvc animated:YES completion:nil];
}


@end


