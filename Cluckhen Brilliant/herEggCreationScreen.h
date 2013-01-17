//
//  herEggCreationScreen.h
//  Cluckhen Brilliant
//
//  Created by Jonathon Albert on 07/08/2012.
//  Copyright (c) 2012 RTCNorth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <QuartzCore/QuartzCore.h>
#import <Twitter/Twitter.h>
//#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "eggCreationStartScreen.h"

@interface herEggCreationScreen : UIViewController <MFMailComposeViewControllerDelegate, UIAlertViewDelegate> {
    
    IBOutlet UIImageView *bottomBar;
    
    IBOutlet UIButton *leftButton;
    UIImage *leftArrow;
    UIImage *leftArrowGlow;
    
    IBOutlet UIButton *rightButton;
    UIImage *rightArrow;
    UIImage *rightArrowGlow;
    
    IBOutlet UIButton *menuButton;
    
    IBOutlet UIButton *closeMenu;
    UIImage *closeMenuImage;
    UIImage *closeMenuImageGlow;
    
    UIImage *menuDiv;
    UIImageView *menuDivider;
    
    UIImage *BBody;
    UIImageView *BaseBody;
    
    UIImage *BFeet;
    UIImageView *BaseFeet;
    
    UIImage *shdw;
    UIImageView *charShadow;

    
    UIImage *tut;
    UIImageView *tutView;
    
    UIImage *stg1Bar;
    UIImage *stg1BarGlow;
    UIImage *stg1BH;
    UIImageView *stg1BoxHeader;
    
    UIImage *stg2Bar;
    UIImage *stg2BarGlow;
    UIImage *stg2BH;
    UIImageView *stg2BoxHeader;

    UIImage *stg3Bar;
    UIImage *stg3BarGlow;
    UIImage *stg3BH;
    UIImageView *stg3BoxHeader;

    UIImage *stg4Bar;
    UIImage *stg4BarGlow;
    UIImage *stg4BH;
    UIImageView *stg4BoxHeader;
    
    UIImage *stg5Bar;
    UIImage *stg5BarGlow;
    UIImage *stg5BH;
    UIImageView *stg5BoxHeader;

    UIImage *detailsBar;
    UIImage *detailsBarBlur;
    UIImage *detailsBH;
    UIImageView *detailsBoxHeader;
    
    UIImage *shareBar;
    UIImage *shareBarBlur;
    UIImage *shareBH;
    UIImageView *shareBoxHeader;
    
    UIImage *closeBar;
    UIImage *closeBarBlur;
    UIImage *closeBH;
    UIImageView *closeBoxHeader;
    IBOutlet UIButton *startAgain;
    
    UIImageView *itemMenus;
    
    Boolean menuVisible;
    Boolean skinItemsVisible;
    Boolean eyesItemsVisible;
    Boolean mouthItemsVisible;
    Boolean hairItemsVisible;
    Boolean feetItemsVisible;
    
    Boolean detailsMenuVisible;
    Boolean shareMenuVisible;
    Boolean closeMenuVisible;

    // Initialise scroll menus
    UIScrollView *skinScrollMenu;
    UIScrollView *eyesScrollMenu;
    UIScrollView *mouthScrollMenu;
    UIScrollView *hairScrollMenu;
    UIScrollView *feetScrollMenu;
    
    // Initialise variables for Skin    
    UIImageView *imageViewSkin;
    UIImage *imageSkin;
    NSString *imageSkinName;
    UIImageView *viewSkin;
    NSArray *subviewsSkin;
    NSString *playerBodyImageName;
    UIImage *playerBodyImage;
    UIImageView *playerBodyImageView;
    
    // Initialise variables for Eyes
    UIImageView *imageViewEyes;
    UIImage *imageEyes;
    NSString *imageEyesName;
    UIImageView *viewEyes;
    NSArray *subviewsEyes;
    NSString *playerEyesImageName;
    UIImage *playerEyesImage;
    UIImageView *playerEyesImageView;
    
    NSString *playerMouthImageName;
    UIImage *playerMouthImage;
    UIImageView *playerMouthImageView;
    
    NSString *playerHairImageName;
    UIImage *playerHairImage;
    UIImageView *playerHairImageView;
    
    NSString *playerFeetImageName;
    UIImage *playerFeetImage;
    UIImageView *playerFeetImageView;
    
    // Labels, textfields and buttons for details form
    UILabel *yourName;
    UITextField *yourNameTF;
    
    UILabel *yolkelName;
    UITextField *yolkelNameTF;
    
    UILabel *email;
    UITextField *emailTF;
    
    UILabel *county;
    UITextField *countyTF;
    
    IBOutlet UIButton *submit;
    IBOutlet UIButton *noSubmit;
    
    IBOutlet UIButton *facebook;
    IBOutlet UITextView *textNoteOrLink;
    
    IBOutlet UIButton *twitter;
    IBOutlet UIButton *saveToPhone;
    
    // Used to set anything to blank
    UIImage *blnk;
}

- (void)initVariables;
- (void)initScrollMenus;
- (void)createImages;

- (IBAction)nextMenu:(id)sender;
- (IBAction)prevMenu:(id)sender;
- (IBAction)openMenu:(id)sender;

- (void)viewSkin:(id)sender;
- (void)viewEyes:(id)sender;
- (void)viewMouth:(id)sender;
- (void)viewHair:(id)sender;
- (void)viewFeet:(id)sender;

- (void)viewDetail:(id)sender;
- (void)hideKeyboard:(id)sender;
- (IBAction)Email:(id)Sender;
- (void)viewShare:(id)sender;
- (IBAction)Facebook:(id)sender;
- (IBAction)Twitter:(id)sender;
- (IBAction)saveToPhone:(id)sender;
- (void)startAgain:(id)sender;

- (void)layoutSkinScrollImages;
- (void)layoutEyesScrollImages;
- (void)layoutMouthScrollImages;
- (void)layoutHairScrollImages;
- (void)layoutFeetScrollImages;
- (void)ClickEventSkinImage:(id)Sender;
- (void)ClickEventEyeImage:(id)Sender;
- (void)ClickEventMouthImage:(id)Sender;
- (void)ClickEventHairImage:(id)Sender;
- (void)ClickEventFeetImage:(id)Sender;

- (IBAction)closeItemMenu:(id)sender;
- (void)clearAll;

@property(nonatomic, retain) UIImage *blnk;

@property(nonatomic, retain) IBOutlet UIImageView *bottomBar;

@property(nonatomic, retain) UIButton *closeMenu;
@property(nonatomic, retain) UIImage *closeMenuImage;
@property(nonatomic, retain) UIImage *closeMenuImageGlow;

@property(nonatomic, retain) UIImage *menuDiv;
@property(nonatomic, retain) UIImageView *menuDivider;

@property(nonatomic, retain) UIImage *shdw;
@property(nonatomic, retain) UIImageView *charShadow;

@property(nonatomic, retain) UIImage *BStart;
@property(nonatomic, retain) UIImageView *BaseStart;

@property(nonatomic, retain) UIImage *BBlank;
@property(nonatomic, retain) UIImageView *BaseBlank;

@property(nonatomic, retain) UIImage *BBody;
@property(nonatomic, retain) UIImageView *BaseBody;

@property(nonatomic, retain) UIImage *BFeet;
@property(nonatomic, retain) UIImageView *BaseFeet;

@property(nonatomic, retain) UIImage *tut;
@property(nonatomic, retain) UIImageView *tutView;

@property(nonatomic, retain) UIImageView *itemMenus;
@property(nonatomic, retain) UIImageView *imageViewSkin;
@property(nonatomic, retain) UIImage *imageSkin;
@property(nonatomic, retain) NSString *imageSkinName;
@property(nonatomic, retain) UIImageView *viewSkin;
@property(nonatomic, retain) NSArray *subviewsSkin;

@property(nonatomic, retain) NSString *playerBodyImageName;
@property(nonatomic, retain) UIImage *playerBodyImage;
@property(nonatomic, retain) UIImageView *playerBodyImageView;

@property(nonatomic, retain) NSString *playerEyesImageName;
@property(nonatomic, retain) UIImage *playerEyesImage;
@property(nonatomic, retain) UIImageView *playerEyesImageView;

@property(nonatomic, retain) NSString *playerMouthImageName;
@property(nonatomic, retain) UIImage *playerMouthImage;
@property(nonatomic, retain) UIImageView *playerMouthImageView;

@property(nonatomic, retain) NSString *playerHairImageName;
@property(nonatomic, retain) UIImage *playerHairImage;
@property(nonatomic, retain) UIImageView *playerHairImageView;

@property(nonatomic, retain) NSString *playerFeetImageName;
@property(nonatomic, retain) UIImage *playerFeetImage;
@property(nonatomic, retain) UIImageView *playerFeetImageView;

@property(nonatomic, retain) UIScrollView *skinScrollMenu;
@property(nonatomic, retain) UIScrollView *eyesScrollMenu;
@property(nonatomic, retain) UIScrollView *mouthScrollMenu;
@property(nonatomic, retain) UIScrollView *hairScrollMenu;
@property(nonatomic, retain) UIScrollView *feetScrollMenu;

@property(nonatomic, retain) UIButton *leftButton;
@property(nonatomic, retain) UIImage *leftArrow;
@property(nonatomic, retain) UIImage *leftArrowGlow;

@property(nonatomic, retain) UIButton *rightButton;
@property(nonatomic, retain) UIImage *rightArrow;
@property(nonatomic, retain) UIImage *rightArrowGlow;

@property(nonatomic, retain) UIButton *menuButton;

@property(nonatomic, retain) UIImage *stg1Bar;
@property(nonatomic, retain) UIImage *stg1BarGlow;
@property(nonatomic, retain) UIImage *stg1BH;
@property(nonatomic, retain) UIImageView *stg1BoxHeader;

@property(nonatomic, retain) UIImage *stg2Bar;
@property(nonatomic, retain) UIImage *stg2BarGlow;
@property(nonatomic, retain) UIImage *stg2BH;
@property(nonatomic, retain) UIImageView *stg2BoxHeader;

@property(nonatomic, retain) UIImage *stg3Bar;
@property(nonatomic, retain) UIImage *stg3BarGlow;
@property(nonatomic, retain) UIImage *stg3BH;
@property(nonatomic, retain) UIImageView *stg3BoxHeader;

@property(nonatomic, retain) UIImage *stg4Bar;
@property(nonatomic, retain) UIImage *stg4BarGlow;
@property(nonatomic, retain) UIImage *stg4BH;
@property(nonatomic, retain) UIImageView *stg4BoxHeader;

@property(nonatomic, retain) UIImage *stg5Bar;
@property(nonatomic, retain) UIImage *stg5BarGlow;
@property(nonatomic, retain) UIImage *stg5BH;
@property(nonatomic, retain) UIImageView *stg5BoxHeader;

@property(nonatomic, retain) UIImage *detailsBar;
@property(nonatomic, retain) UIImage *detailsBarBlur;
@property(nonatomic, retain) UIImage *detailsBH;
@property(nonatomic, retain) UIImageView *detailsBoxHeader;

@property(nonatomic, retain) UIImage *shareBar;
@property(nonatomic, retain) UIImage *shareBarBlur;
@property(nonatomic, retain) UIImage *shareBH;
@property(nonatomic, retain) UIImageView *shareBoxHeader;

@property(nonatomic, retain) UIImage *closeBar;
@property(nonatomic, retain) UIImage *closeBarBlur;
@property(nonatomic, retain) UIImage *closeBH;
@property(nonatomic, retain) UIImageView *closeBoxHeader;
@property(nonatomic, retain)IBOutlet UIButton *startAgain;

// Labels, textfields and buttons for details form
@property(nonatomic, retain) UILabel *yourName;
@property(nonatomic, retain) UITextField *yourNameTF;

@property(nonatomic, retain) UILabel *yolkelName;
@property(nonatomic, retain) UITextField *yolkelNameTF;

@property(nonatomic, retain) UILabel *email;
@property(nonatomic, retain) UITextField *emailTF;

@property(nonatomic, retain) UILabel *county;
@property(nonatomic, retain) UITextField *countyTF;

@property(nonatomic, retain) IBOutlet UIButton *submit;
@property(nonatomic, retain) IBOutlet UIButton *noSubmit;

// Share menu
@property(nonatomic, retain) IBOutlet UIButton *facebook;
@property (strong, nonatomic) IBOutlet UITextView *textNoteOrLink;

@property(nonatomic, retain) IBOutlet UIButton *twitter;
@property(nonatomic, retain) IBOutlet UIButton *saveToPhone;


@end
