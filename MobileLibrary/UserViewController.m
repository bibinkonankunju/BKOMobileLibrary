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
UITableView *tableview;

NSArray *BooksDatas;
NSArray *searchResults;

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
    
    UIButton *lgoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, sdheight - 30, sdwidth, 30)];
    lgoutBtn.backgroundColor = [UIColor orangeColor];
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
    
    UILabel *welcomelbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, sdwidth, 50)];
    welcomelbl.text = @"Welcome User";
    welcomelbl.textAlignment = NSTextAlignmentCenter;
    welcomelbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [homeView addSubview:welcomelbl];
}

-(void) BookView{
    [self removeSuperViews];
    bookView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    [self.view addSubview:bookView];
    
    [self fetchBookNames]; //Fill book names to list
    
    searchResults = nil;
    [tableview reloadData];
    
    searchField=[[UITextField alloc]initWithFrame:CGRectMake(sdwidth * 0.25, 10, sdwidth * 0.5, 30)];
    [bookView addSubview:searchField];
    
    searchField.delegate = self;
    searchField.backgroundColor=[UIColor whiteColor];
    UIImageView *imgSearch=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)]; // Set frame as per space required around icon
    [imgSearch setImage:[UIImage imageNamed:@"search_books.png"]];
    [imgSearch setContentMode:UIViewContentModeCenter];// Set content mode centre
    searchField.leftView=imgSearch;
    
    
    searchField.textColor=[UIColor whiteColor];
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
    
    
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(sdwidth*0.25, 41, sdwidth*0.5, sdheight/3)];
    tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableview.delegate = self;
    tableview.dataSource=self;
    tableview.tintColor=[UIColor clearColor];
    [tableview setBackgroundView:nil];
    [tableview setBackgroundColor:[UIColor clearColor]];
    tableview.userInteractionEnabled=false;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [bookView addSubview:tableview];
}

-(void)fetchBookNames{
    BooksDatas = @[@"Anna Karenina",@"Alice in Wonderland",@"Wings of Fire",@"2 States",@"Half Girlfriend"];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 21;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [searchResults count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self filterContentForSearchText:newString scope:@""];
    [tableview reloadData];
    tableview.userInteractionEnabled=true;
    return  YES;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    searchResults = [BooksDatas filteredArrayUsingPredicate:resultPredicate];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *selectedbook=[searchResults objectAtIndex:indexPath.row];
    searchResults=nil;
    searchField.text = selectedbook;
    [tableview reloadData];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    searchResults=nil;
    [tableview reloadData];
    tableview.userInteractionEnabled=false;
}

-(void) ProfileView{
    [self removeSuperViews];
    profileView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 105)];
    [self.view addSubview:profileView];
    
    UILabel *profilelbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, sdwidth, 50)];
    profilelbl.text = @"User Profile";
    profilelbl.textAlignment = NSTextAlignmentCenter;
    profilelbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [profileView addSubview:profilelbl];
    
    UIImageView *imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(5, 50, 50, 50)];
    [imgUser setImage:[UIImage imageNamed:@"user.png"]];
    [imgUser setContentMode:UIViewContentModeScaleAspectFit];
    [profileView addSubview:imgUser];

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


