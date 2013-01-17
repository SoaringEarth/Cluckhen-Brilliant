//
//  submitDetailsScreen.m
//  Cluckhen Brilliant
//
//  Created by Jonathon Albert on 10/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "submitDetailsScreen.h"

@interface submitDetailsScreen ()

@end

@implementation submitDetailsScreen

@synthesize submitScrollMenu;
@synthesize pageTitleLabel, yolkelNameLabel, yourNameLabel, cityNameLabel, regionNameLabel;
@synthesize yolkelNameField, yourNameField, cityNameField, regionNameField;
@synthesize goBack, Submit;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Create the submit details scroll menu
    submitScrollMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    // Configure the scroll menu's settings.
    [submitScrollMenu setCanCancelContentTouches:NO];
    submitScrollMenu.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    submitScrollMenu.clipsToBounds = YES;
    submitScrollMenu.scrollEnabled = YES;
    submitScrollMenu.showsVerticalScrollIndicator = YES;
    [submitScrollMenu setPagingEnabled:NO];
    [submitScrollMenu setContentSize:CGSizeMake([submitScrollMenu bounds].size.width, 500)];
    [self.view addSubview:submitScrollMenu];
    
    [self createLabelsAndFields];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (void)createLabelsAndFields {
    pageTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 15, 120, 50)];
    pageTitleLabel.text = @"Details";
    pageTitleLabel.font = [UIFont fontWithName:@"arial" size:26.0];
    pageTitleLabel.textColor = [UIColor orangeColor];
    pageTitleLabel.backgroundColor = [UIColor clearColor];
    [submitScrollMenu addSubview:pageTitleLabel];
    
    yolkelNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 80, 120, 30)];
    yolkelNameLabel.text = @"Yolkel Name";
    yolkelNameLabel.font = [UIFont fontWithName:@"arial" size:20.0];
    yolkelNameLabel.textColor = [UIColor whiteColor];
    yolkelNameLabel.backgroundColor = [UIColor clearColor];
    [submitScrollMenu addSubview:yolkelNameLabel];
    
    yolkelNameField = [[UITextField alloc] initWithFrame:CGRectMake(25, 115, 200, 50)];
    yolkelNameField.placeholder = @"Enter Text";
    yolkelNameField.borderStyle = UITextBorderStyleRoundedRect;
    [submitScrollMenu addSubview:yolkelNameField];
    
    yourNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 180, 120, 30)];
    yourNameLabel.text = @"Your Name";
    yourNameLabel.font = [UIFont fontWithName:@"arial" size:20.0];
    yourNameLabel.textColor = [UIColor whiteColor];
    yourNameLabel.backgroundColor = [UIColor clearColor];
    [submitScrollMenu addSubview:yourNameLabel];
    
    yourNameField = [[UITextField alloc] initWithFrame:CGRectMake(25, 215, 200, 50)];
    yourNameField.placeholder = @"Enter Text";
    yourNameField.borderStyle = UITextBorderStyleRoundedRect;
    [submitScrollMenu addSubview:yourNameField];
    
    cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 280, 120, 30)];
    cityNameLabel.text = @"City / Town";
    cityNameLabel.font = [UIFont fontWithName:@"arial" size:20.0];
    cityNameLabel.textColor = [UIColor whiteColor];
    cityNameLabel.backgroundColor = [UIColor clearColor];    
    [submitScrollMenu addSubview:cityNameLabel]; 
    
    cityNameField = [[UITextField alloc] initWithFrame:CGRectMake(25, 315, 200, 50)];
    cityNameField.placeholder = @"Enter Text";
    cityNameField.borderStyle = UITextBorderStyleRoundedRect;
    [submitScrollMenu addSubview:cityNameField];
    
    goBack = [[UIButton alloc] initWithFrame:CGRectMake(25, 380, 100, 50)];
    [goBack setTitle:@"Go Back" forState:UIControlStateNormal];
    [submitScrollMenu addSubview:goBack];
    
    Submit = [[UIButton alloc] initWithFrame:CGRectMake(100, 380, 100, 50)];
    [Submit setTitle:@"Submit" forState:UIControlStateNormal];
    [submitScrollMenu addSubview:Submit];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
