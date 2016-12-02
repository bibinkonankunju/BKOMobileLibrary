//
//  UserViewController.m
//  MobileLibrary
//
//  Created by BIBIN K ONANKUNJU on 07/11/16.
//  Copyright © 2016 BIBIN K ONANKUNJU. All rights reserved.
//

#import "UserViewController.h"
#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

float sdwidth,sdheight,menuimgwidth;
UIView *homeView, *bookView, *contactView, *leftView, *rightView, *centreView;
UITextField *searchField;
UITableView *tableview;
UITapGestureRecognizer *centerClick;

NSArray *BooksDatas;
NSArray *searchResults;

CLGeocoder *ceo;
CLLocationManager *locationManager;

@interface UserViewController()
@end


@implementation UserViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];

    CGRect screensize = [[UIScreen mainScreen]bounds];
    sdwidth = screensize.size.width;
    sdheight = screensize.size.height;
    
    menuimgwidth = sdwidth * 0.1;
    
    CGRect mainrect = self.view.frame;
    mainrect.origin.x = - (sdwidth - menuimgwidth);
    mainrect.origin.y = 0;
    mainrect.size.height = sdheight;
    mainrect.size.width = sdwidth + 2 * (sdwidth - menuimgwidth);
    self.view.frame = mainrect;
    
    leftView = [[UIView alloc]initWithFrame:CGRectMake(-(sdwidth - menuimgwidth), 25, sdwidth - menuimgwidth, sdheight-25)];
    centreView = [[UIView alloc]initWithFrame:CGRectMake(0, 25, sdwidth, sdheight-25)];
    rightView = [[UIView alloc]initWithFrame:CGRectMake(sdwidth, 25, sdwidth - menuimgwidth, sdheight-25)];
    [self.view addSubview:leftView];
    [self.view addSubview:centreView];
    [self.view addSubview:rightView];

    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"centerback.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //self.view.backgroundColor = [UIColor lightGrayColor];

    [self loadleftView];
    [self loadcenterView];
    [self loadrightView];
    
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LeftSideView

-(void)loadleftView{
    //leftView.backgroundColor = [UIColor redColor];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"loginback.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    leftView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    UILabel *profilelbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, sdwidth - menuimgwidth, 50)];
    profilelbl.text = @"User Profile";
    profilelbl.textAlignment = NSTextAlignmentCenter;
    profilelbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [leftView addSubview:profilelbl];
    
    UIImageView *imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(5, 100, 76, 76)];
    [imgUser setImage:[UIImage imageNamed:@"user.png"]];
    [imgUser setContentMode:UIViewContentModeScaleAspectFit];
    [leftView addSubview:imgUser];
    
    UILabel *namelbl = [[UILabel alloc]initWithFrame:CGRectMake(83, 100, sdwidth - menuimgwidth - 57, 38)];
    namelbl.text = @"John Varghese";
    namelbl.textAlignment = NSTextAlignmentLeft;
    namelbl.font=[UIFont fontWithName:@"TimesNewRoman" size:18.0];
    [leftView addSubview:namelbl];
    
    UILabel *emaillbl = [[UILabel alloc]initWithFrame:CGRectMake(83, 138, sdwidth - menuimgwidth - 57, 38)];
    emaillbl.text = @"johnvarghese@gmail.com";
    emaillbl.textAlignment = NSTextAlignmentLeft;
    emaillbl.font=[UIFont fontWithName:@"TimesNewRoman" size:18.0];
    [leftView addSubview:emaillbl];
    
    UILabel *aboutlbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, sdwidth - menuimgwidth, 50)];
    aboutlbl.text = @"About Me";
    aboutlbl.textAlignment = NSTextAlignmentCenter;
    aboutlbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [leftView addSubview:aboutlbl];
    
    UILabel *otherlbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, sdwidth - menuimgwidth, 50)];
    otherlbl.text = @"Other Info";
    otherlbl.textAlignment = NSTextAlignmentCenter;
    otherlbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [leftView addSubview:otherlbl];

    
    
    
    
    UIButton *lgoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, sdheight - 55, sdwidth - menuimgwidth, 30)];
    lgoutBtn.backgroundColor = [UIColor orangeColor];
    [lgoutBtn setTitle:@"LogOut" forState:UIControlStateNormal];
    [lgoutBtn addTarget:self action:@selector(LogOut_BtnClk:) forControlEvents:UIControlEventTouchDown];
    [leftView addSubview:lgoutBtn];
}

- (IBAction)LogOut_BtnClk:(id)sender {
    ViewController *uvc = [[ViewController alloc]init];
    [self presentViewController:uvc animated:YES completion:nil];
}

#pragma mark - RightSideView

-(void)loadrightView{
    //rightView.backgroundColor = [UIColor purpleColor];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"rightback.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    rightView.backgroundColor = [UIColor colorWithPatternImage:image];
}

#pragma mark - CenterSideView

-(void)loadcenterView{
    //centreView.backgroundColor = [UIColor magentaColor];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"maincenterback.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    centreView.backgroundColor = [UIColor colorWithPatternImage:image];
    
    UIImage *leftbtnImage = [UIImage imageNamed:@"menu1.png"];
    UIButton *leftmenuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, menuimgwidth - 4, 25)];
    [leftmenuBtn setImage:leftbtnImage forState:UIControlStateNormal];
    [leftmenuBtn addTarget:self action:@selector(leftviewCall) forControlEvents:UIControlEventTouchUpInside];
    [centreView addSubview:leftmenuBtn];
    
    UIImage *rightbtnImage = [UIImage imageNamed:@"menu1.png"];
    UIButton *rightmenuBtn = [[UIButton alloc]initWithFrame:CGRectMake(sdwidth * 0.9 + 2 , 5, menuimgwidth - 4, 25)];
    [rightmenuBtn setImage:rightbtnImage forState:UIControlStateNormal];
    [rightmenuBtn addTarget:self action:@selector(rightviewCall) forControlEvents:UIControlEventTouchUpInside];
    [centreView addSubview:rightmenuBtn];
    
    centerClick =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(centerviewCall:)];
    centerClick.numberOfTouchesRequired = 1;
    [centreView addGestureRecognizer:centerClick];
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Home", @"Books", @"Contact", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor whiteColor];
    [centreView addSubview:segmentedControl];
    
    CGRect segframe=segmentedControl.frame;
    segframe.size.width = sdwidth * 0.8;
    segframe.size.height = 25;
    segframe.origin.x = menuimgwidth;
    segframe.origin.y = 5;
    segmentedControl.frame=segframe;
    
    homeView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 75)];
    bookView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 75)];
    contactView = [[UIView alloc]initWithFrame:CGRectMake(0, 75, sdwidth, sdheight - 75)];
    [centreView addSubview:homeView];
    [centreView addSubview:bookView];
    [centreView addSubview:contactView];
    
    [self MainView];
    
}

-(void) MainView{
    [self removeSuperViews];
    homeView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, sdwidth, sdheight - 105)];
    [centreView addSubview:homeView];
    
    UILabel *welcomelbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, sdwidth, 50)];
    welcomelbl.text = @"Welcome User";
    welcomelbl.textAlignment = NSTextAlignmentCenter;
    welcomelbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [homeView addSubview:welcomelbl];
    
    UILabel *takenbooklbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, sdwidth, 50)];
    takenbooklbl.text = @"Currently Reading";
    takenbooklbl.textAlignment = NSTextAlignmentCenter;
    takenbooklbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [homeView addSubview:takenbooklbl];
    
    UILabel *wishlistlbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, sdwidth, 50)];
    wishlistlbl.text = @"To Read";
    wishlistlbl.textAlignment = NSTextAlignmentCenter;
    wishlistlbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [homeView addSubview:wishlistlbl];
    
    UILabel *favbooklbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, sdwidth, 50)];
    favbooklbl.text = @"Favourites";
    favbooklbl.textAlignment = NSTextAlignmentCenter;
    favbooklbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [homeView addSubview:favbooklbl];
}

-(void) BookView{
    [self removeSuperViews];
    bookView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, sdwidth, sdheight - 105)];
    [centreView addSubview:bookView];
    
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
    
    UILabel *newbooklbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, sdwidth, 50)];
    newbooklbl.text = @"New Arrivals";
    newbooklbl.textAlignment = NSTextAlignmentCenter;
    newbooklbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [bookView addSubview:newbooklbl];
    
    UILabel *popularlistlbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 220, sdwidth, 50)];
    popularlistlbl.text = @"Popular Books";
    popularlistlbl.textAlignment = NSTextAlignmentCenter;
    popularlistlbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [bookView addSubview:popularlistlbl];
    
    UILabel *waitbooklbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 320, sdwidth, 50)];
    waitbooklbl.text = @"Available Soon";
    waitbooklbl.textAlignment = NSTextAlignmentCenter;
    waitbooklbl.font=[UIFont fontWithName:@"TimesNewRoman" size:20.0];
    [bookView addSubview:waitbooklbl];
    
}

-(void) ContactView{
    [self removeSuperViews];
    contactView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, sdwidth, sdheight - 105)];
    [centreView addSubview:contactView];
    
    UILabel *profilelbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, sdwidth, 50)];
    profilelbl.text = @"Contact Info";
    profilelbl.textAlignment = NSTextAlignmentCenter;
    profilelbl.font=[UIFont fontWithName:@"Papyrus" size:33.0];
    [contactView addSubview:profilelbl];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:8.5241
                                                            longitude:76.9366
                                                                 zoom:6];

    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake(0, 50, sdwidth, sdheight - 100) camera:camera];
    mapView.myLocationEnabled = YES;
    [mapView setMinZoom:5 maxZoom:15];
    [contactView addSubview:mapView];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(8.5241, 76.9366);
    marker.title = @"Trivandrum";
    marker.snippet = @"Kerala, India";
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [UIImage imageNamed:@"MarkerIcon"];
    marker.map = mapView;
}

#pragma mark - CenterViewSupportingMethods

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

#pragma mark - SideMenuButtonClicks

-(void)leftviewCall{
    if(leftView.frame.origin.x == 0)
    {
        [self centerviewCall:nil];
    }
    else
    {
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [leftView setFrame:CGRectMake(0, 25, sdwidth - menuimgwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [centreView setFrame:CGRectMake(sdwidth - menuimgwidth, 25, sdwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [rightView setFrame:CGRectMake(sdwidth + (sdwidth - menuimgwidth), 25, sdwidth - menuimgwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    }
}

-(void)rightviewCall{
    if(rightView.frame.origin.x == menuimgwidth)
    {
        [self centerviewCall:nil];
    }
    else
    {
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [leftView setFrame:CGRectMake(- 2*(sdwidth - menuimgwidth), 25, sdwidth - menuimgwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [centreView setFrame:CGRectMake(-(sdwidth - menuimgwidth), 25, sdwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [rightView setFrame:CGRectMake(menuimgwidth, 25, sdwidth - menuimgwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    }
}

-(void)centerviewCall:(UITapGestureRecognizer *)recognizer{
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [leftView setFrame:CGRectMake(-(sdwidth - menuimgwidth), 25, sdwidth - menuimgwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [centreView setFrame:CGRectMake(0, 25, sdwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
    [UIView animateWithDuration:0.35
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [rightView setFrame:CGRectMake(sdwidth, 25, sdwidth - menuimgwidth, sdheight-25)];
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

#pragma mark - SegmentControlSection

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
            [self ContactView];
             break;
        default:
            break;
    }
}

#pragma mark - Supporting Methods

-(void) removeSuperViews
{
    [homeView removeFromSuperview];
    [bookView removeFromSuperview];
    [contactView removeFromSuperview];
}
@end

