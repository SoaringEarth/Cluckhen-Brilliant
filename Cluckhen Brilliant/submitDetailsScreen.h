//
//  submitDetailsScreen.h
//  Cluckhen Brilliant
//
//  Created by Jonathon Albert on 10/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface submitDetailsScreen : UIViewController {
    
    UIScrollView *submitScrollMenu;
    
    UILabel *pageTitleLabel;
    UILabel *yolkelNameLabel;
    UILabel *yourNameLabel;
    UILabel *cityNameLabel;
    UILabel *regionNameLabel;
    
    UITextField *yolkelNameField;
    UITextField *yourNameField;
    UITextField *cityNameField;
    UITextField *regionNameField;

    UIButton *goBack;
    UIButton *Submit;
}
@property(nonatomic, retain) UIScrollView *submitScrollMenu;
@property(nonatomic, retain) UILabel *pageTitleLabel;
@property(nonatomic, retain) UILabel *yolkelNameLabel;
@property(nonatomic, retain) UILabel *yourNameLabel;
@property(nonatomic, retain) UILabel *cityNameLabel;
@property(nonatomic, retain) UILabel *regionNameLabel;
@property(nonatomic, retain) UITextField *yolkelNameField;
@property(nonatomic, retain) UITextField *yourNameField;
@property(nonatomic, retain) UITextField *cityNameField;
@property(nonatomic, retain) UITextField *regionNameField;
@property(nonatomic, retain) UIButton *goBack;
@property(nonatomic, retain) UIButton *Submit;

- (IBAction)textFieldReturn:(id)sender;

- (void)createLabelsAndFields;

@end
