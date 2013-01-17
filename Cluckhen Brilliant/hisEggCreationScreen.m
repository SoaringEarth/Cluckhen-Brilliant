//
//  hisEggCreationScreen.m
//  Cluckhen Brilliant
//
//  Created by Jonathon Albert on 07/08/2012.
//  Copyright (c) 2012 RTCNorth. All rights reserved.
//

// This file is used for creating the core mechanics and generating
// the male images that will be selectable from the menu system.
//

/*
 IMPORTANT - Facebook will not work until general release of iOS6
 IMPORTANT - required frameworks for facebook to work this way are included
 in the latest version of xcode for iOS6.
 
 INSTRUCTIONS
 1. Un-comment all code in facebook method.
 2. Un-comment '#import <Social/Social.h> in hisEggCreationScreen.h'.
 3. Add 'Social.Framework' to list of frameworks. to do this see below.
 4. Click on the project at the top of the left hand menu (the one with the files)
 5. Scroll to the bottom where you will see a list of existing frameworks.
 6. Click on the plus symbol.
 7. Scroll through the list till you see 'Social.Framework'.
 8. Click 'Add'.
 
 With the final step complete test on simulator/device
 and everything should work.
 */

#import "hisEggCreationScreen.h"
#import "AppDelegate.h"

@interface hisEggCreationScreen ()

@end

@implementation hisEggCreationScreen
@synthesize bottomBar, leftButton, rightButton, menuButton, leftArrow, leftArrowGlow, rightArrow, rightArrowGlow, stg1Bar, stg1BarGlow, stg1BH, stg1BoxHeader, stg2Bar, stg2BarGlow, stg2BH, stg3Bar, stg3BarGlow, stg3BH, stg4Bar, stg4BarGlow, stg4BH, stg5Bar, stg5BarGlow, viewSkin, stg5BH, stg2BoxHeader, stg3BoxHeader, stg4BoxHeader, stg5BoxHeader, detailsBar, detailsBarBlur, detailsBH, detailsBoxHeader, shareBar, shareBarBlur, shareBH, shareBoxHeader, closeBar, closeBarBlur, closeBH, closeBoxHeader, closeMenu, closeMenuImage, closeMenuImageGlow, itemMenus, skinScrollMenu, eyesScrollMenu, mouthScrollMenu, hairScrollMenu, feetScrollMenu, imageSkinName, imageSkin, imageViewSkin, subviewsSkin, playerBodyImageName, playerBodyImage, playerBodyImageView, playerEyesImageName, playerEyesImage, playerEyesImageView, playerMouthImageName, playerMouthImage, playerMouthImageView, playerHairImageName, playerHairImage, playerHairImageView, playerFeetImageName, playerFeetImage, playerFeetImageView, blnk, yourName, yourNameTF, yolkelName, yolkelNameTF, email, emailTF, county, countyTF, submit, noSubmit, facebook, twitter, saveToPhone, menuDivider, menuDiv, startAgain, BBody, BaseBody, BFeet, BaseFeet, shdw, charShadow, tut, tutView;

@synthesize textNoteOrLink = _textNoteOrLink;

int hiscount = 0;
int hisNumImages = 6;
int hisImageWidth = 256;
int hisImageHeight = 90;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark methods for start-up stuff start

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Enable the menu button;
    [menuButton setEnabled:TRUE];
    
    [self initVariables];
    
    [self initScrollMenus];
    
    [self createImages];
    
    // Create the image for the menu, off screen
    // After the screen loads create the menu off screen and set menuVisible to FALSE
    itemMenus = [[UIImageView alloc] initWithFrame:CGRectMake(5, -5, 310, 470)];
    itemMenus.image = [UIImage imageNamed:@"ImageElementBox.png"];
    itemMenus.alpha = 1.0;
    [itemMenus setHidden:TRUE];
    
    [self.view addSubview:charShadow];
    [self.view addSubview:BaseBody];
    [self.view addSubview:BaseFeet];
    [self.view addSubview:tutView];
    [tutView setHidden:FALSE];
    
    [self layoutSkinScrollImages];
    [self layoutEyesScrollImages];
    [self layoutMouthScrollImages];
    [self layoutHairScrollImages];
    [self layoutFeetScrollImages];
    
    // Set the properties of the close menu button which appears with the item menu.
    //closeMenu = [[UIButton alloc] initWithFrame:CGRectMake(260, 15, 45, 45)]; // Set in Storyboard
    [closeMenu setHidden:TRUE];
    [closeMenu setEnabled:FALSE];
    
    [startAgain setHidden:TRUE];
    [startAgain setEnabled:FALSE];
    
    switch (hiscount) {
        case 0:
            [menuButton setBackgroundImage:stg1Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg1BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = FALSE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
    }
}

- (void)initVariables {
    // Init all UIImage vars to nil.
    hiscount = 0;
    
    BBody = nil;
    BaseBody = nil;
    BFeet = nil;
    BaseFeet = nil;
    
    menuDiv = nil;
    menuDivider = nil;
    
    stg1Bar = nil;
    stg1BarGlow = nil;
    stg1BH = nil;
    
    stg2Bar = nil;
    stg2BarGlow = nil;
    stg2BH = nil;
    
    stg3Bar = nil;
    stg3BarGlow = nil;
    stg3BH = nil;
    
    stg4Bar = nil;
    stg4BarGlow = nil;
    stg4BH = nil;
    
    stg5Bar = nil;
    stg5BarGlow = nil;
    stg5BH = nil;
    
    detailsBar = nil;
    detailsBarBlur = nil;
    shareBar = nil;
    shareBarBlur = nil;
    closeBar = nil;
    closeBarBlur = nil;
    
}

- (void)initScrollMenus {
    // create the scroll menu to store the skin items.
    skinScrollMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 63, 265, 380)];
    
    // Configure the scroll menu's settings.
    [skinScrollMenu setCanCancelContentTouches:NO];
    skinScrollMenu.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    skinScrollMenu.clipsToBounds = YES;
    skinScrollMenu.scrollEnabled = YES;
    skinScrollMenu.showsVerticalScrollIndicator = YES;
    [skinScrollMenu setPagingEnabled:NO];
    [skinScrollMenu setHidden:TRUE];
    [itemMenus addSubview:skinScrollMenu];
    
    // Create the eye scroll menu
    eyesScrollMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 63, 265, 380)];
    
    // Configure the scroll menu's settings.
    [eyesScrollMenu setCanCancelContentTouches:NO];
    eyesScrollMenu.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    eyesScrollMenu.clipsToBounds = YES;
    eyesScrollMenu.scrollEnabled = YES;
    eyesScrollMenu.showsVerticalScrollIndicator = YES;
    [eyesScrollMenu setPagingEnabled:NO];
    [eyesScrollMenu setHidden:TRUE];
    
    [itemMenus addSubview:eyesScrollMenu];
    
    // Create the mouth scroll menu
    mouthScrollMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 63, 265, 380)];
    
    // Configure the scroll menu's settings.
    [mouthScrollMenu setCanCancelContentTouches:NO];
    mouthScrollMenu.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    mouthScrollMenu.clipsToBounds = YES;
    mouthScrollMenu.scrollEnabled = YES;
    mouthScrollMenu.showsVerticalScrollIndicator = YES;
    [mouthScrollMenu setPagingEnabled:NO];
    [mouthScrollMenu setHidden:TRUE];
    
    [itemMenus addSubview:mouthScrollMenu];
    
    // Create the hair scroll menu
    hairScrollMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 63, 265, 380)];
    
    // Configure the scroll menu's settings.
    [hairScrollMenu setCanCancelContentTouches:NO];
    hairScrollMenu.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    hairScrollMenu.clipsToBounds = YES;
    hairScrollMenu.scrollEnabled = YES;
    hairScrollMenu.showsVerticalScrollIndicator = YES;
    [hairScrollMenu setPagingEnabled:NO];
    [hairScrollMenu setHidden:TRUE];
    
    [itemMenus addSubview:hairScrollMenu];
    
    // Create the feet scroll menu
    feetScrollMenu = [[UIScrollView alloc] initWithFrame:CGRectMake(30, 63, 265, 380)];
    
    // Configure the scroll menu's settings.
    [feetScrollMenu setCanCancelContentTouches:NO];
    feetScrollMenu.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    feetScrollMenu.clipsToBounds = YES;
    feetScrollMenu.scrollEnabled = YES;
    feetScrollMenu.showsVerticalScrollIndicator = YES;
    [feetScrollMenu setPagingEnabled:NO];
    [feetScrollMenu setHidden:TRUE];
    
    [itemMenus addSubview:feetScrollMenu];
    
}

- (void)createImages {
    
    BBody = [UIImage imageNamed:@"BaseBody.png"];
    BaseBody = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [BaseBody setImage:BBody];
    
    BFeet = [UIImage imageNamed:@"BaseFeet.png"];
    BaseFeet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [BaseFeet setImage:BFeet];
    
    shdw = [UIImage imageNamed:@"Shadow.png"];
    charShadow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [charShadow setImage:shdw];
    
    tut = [UIImage imageNamed:@"IntroButtons.png"];
    tutView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [tutView setImage:tut];
    
    stg1Bar = [UIImage imageNamed:@"Stg1Bar.png"];
    stg1BarGlow = [UIImage imageNamed:@"Stg1BarBlur.png"];
    stg1BH = [UIImage imageNamed:@"Stg1BoxHeader.png"];
    stg1BoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [stg1BoxHeader setImage:stg1BH];
    
    stg2Bar = [UIImage imageNamed:@"Stg2Bar.png"];
    stg2BarGlow = [UIImage imageNamed:@"Stg2BarBlur.png"];
    stg2BH = [UIImage imageNamed:@"Stg2BoxHeader.png"];
    stg2BoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [stg2BoxHeader setImage:stg2BH];
    
    stg3Bar = [UIImage imageNamed:@"Stg3Bar.png"];
    stg3BarGlow = [UIImage imageNamed:@"Stg3BarBlur.png"];
    stg3BH = [UIImage imageNamed:@"Stg3BoxHeader.png"];
    stg3BoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [stg3BoxHeader setImage:stg3BH];
    
    stg4Bar = [UIImage imageNamed:@"Stg4Bar.png"];
    stg4BarGlow = [UIImage imageNamed:@"Stg4BarBlur.png"];
    stg4BH = [UIImage imageNamed:@"Stg4BoxHeader.png"];
    stg4BoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [stg4BoxHeader setImage:stg4BH];
    
    stg5Bar = [UIImage imageNamed:@"Stg5Bar.png"];
    stg5BarGlow = [UIImage imageNamed:@"Stg5BarBlur.png"];
    stg5BH = [UIImage imageNamed:@"Stg5BoxHeader.png"];
    stg5BoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [stg5BoxHeader setImage:stg5BH];
    
    detailsBar = [UIImage imageNamed:@"DetailsBar.png"];
    detailsBarBlur = [UIImage imageNamed:@"DetailsBarBlur.png"];
    detailsBH = [UIImage imageNamed:@"DetailBoxHeader.png"];
    detailsBoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [detailsBoxHeader setImage:detailsBH];
    
    shareBar = [UIImage imageNamed:@"ShareBar.png"];
    shareBarBlur = [UIImage imageNamed:@"ShareBarBlur.png"];
    shareBH = [UIImage imageNamed:@"ShareBoxHeader.png"];
    shareBoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [shareBoxHeader setImage:shareBH];
    
    closeBar = [UIImage imageNamed:@"StartAgain.png"];
    closeBarBlur = [UIImage imageNamed:@"StartAgain.png"];
    /*
    closeBH = [UIImage imageNamed:@"CloseBoxHeader.png"];
    closeBoxHeader = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, 202, 47)];
    [closeBoxHeader setImage:closeBH];
     */
    
    closeMenuImage = [UIImage imageNamed:@"X.png"];
    closeMenuImageGlow = [UIImage imageNamed:@"XGlow.png"];
}

#pragma mark methods for start-up stuff end

#pragma mark methods for the menu system start

// method for showing the correct image that links with the
// corresponding menu.
- (IBAction)nextMenu:(id)sender {
    hiscount += 1;
    
    if (hiscount > 7) {
        hiscount = 0;
    }
    
    switch (hiscount)
    {
        case 1:
            [menuButton setBackgroundImage:stg2Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg2BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = FALSE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 2:
            [menuButton setBackgroundImage:stg3Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg3BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = FALSE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 3:
            [menuButton setBackgroundImage:stg4Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg4BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = FALSE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 4:
            [menuButton setBackgroundImage:stg5Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg5BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = FALSE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 5:
            [menuButton setBackgroundImage:detailsBar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:detailsBarBlur forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = FALSE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 6:
            [menuButton setBackgroundImage:shareBar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:shareBarBlur forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = FALSE;
            closeMenuVisible = TRUE;
            break;
        case 7:
            [menuButton setBackgroundImage:closeBar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:closeBarBlur forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = FALSE;
            break;
        default:
            [menuButton setBackgroundImage:stg1Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg1BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible =  FALSE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
    }
}

- (IBAction)prevMenu:(id)sender {
    hiscount -= 1;
    
    if (hiscount < 0) {
        hiscount = 7;
    }
    
    switch (hiscount)
    {
        case 1:
            [menuButton setBackgroundImage:stg2Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg2BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = FALSE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 2:
            [menuButton setBackgroundImage:stg3Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg3BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = FALSE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 3:
            [menuButton setBackgroundImage:stg4Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg4BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = FALSE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 4:
            [menuButton setBackgroundImage:stg5Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg5BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = FALSE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 5:
            [menuButton setBackgroundImage:detailsBar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:detailsBarBlur forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = FALSE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
        case 6:
            [menuButton setBackgroundImage:shareBar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:shareBarBlur forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = FALSE;
            closeMenuVisible = TRUE;
            break;
        case 7:
            [menuButton setBackgroundImage:closeBar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:closeBarBlur forState:UIControlStateHighlighted];
            skinItemsVisible = TRUE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = FALSE;
            break;
        default:
            [menuButton setBackgroundImage:stg1Bar forState:UIControlStateNormal];
            [menuButton setBackgroundImage:stg1BarGlow forState:UIControlStateHighlighted];
            skinItemsVisible =  FALSE;
            eyesItemsVisible = TRUE;
            mouthItemsVisible = TRUE;
            hairItemsVisible = TRUE;
            feetItemsVisible = TRUE;
            detailsMenuVisible = TRUE;
            shareMenuVisible = TRUE;
            closeMenuVisible = TRUE;
            break;
    }
}

- (IBAction)openMenu:(id)sender {
    switch (hiscount)
    {
        case 1:
            [self viewEyes:sender];
            break;
        case 2:
            [self viewMouth:sender];
            break;
        case 3:
            [self viewHair:sender];
            break;
        case 4:
            [self viewFeet:sender];
            break;
        case 5:
            [self viewDetail:sender];
            break;
        case 6:
            [self viewShare:sender];
            break;
        case 7:
            [self startAgain:sender];
            break;
        default:
            [self viewSkin:sender];
            break;
    }
}

#pragma mark methods for the menu system end

#pragma mark methods showing the relevant object menus start

- (void)viewSkin:(id)sender {
    if (skinItemsVisible == FALSE) {
        
        // Make the menu appear on the screen quite suddenly.
        [itemMenus setHidden:FALSE];
        [self.view addSubview:itemMenus];
        
        [closeMenu setHidden:FALSE];
        [closeMenu setEnabled:TRUE];
        [closeMenu setBackgroundImage:closeMenuImage forState:UIControlStateNormal];
        [closeMenu setBackgroundImage:closeMenuImageGlow forState:UIControlStateHighlighted];
        [self.view addSubview:closeMenu];
        
        [self.view addSubview:stg1BoxHeader];
        
        // Make the scroll menu appear inside the item menu
        [skinScrollMenu setHidden:FALSE];
        [self.view addSubview:skinScrollMenu];
        
        [menuButton setEnabled:FALSE];
        
        // Set the bools to true
        skinItemsVisible = TRUE;
        
    } else {
        [self closeItemMenu:sender];
    }
}

- (void)viewEyes:(id)sender {
    if (eyesItemsVisible == FALSE) {
        
        // Make the menu appear on the screen quite suddenly.
        [itemMenus setHidden:FALSE];
        [self.view addSubview:itemMenus];
        
        // Make the scroll menu appear inside the item menu
        [eyesScrollMenu setHidden:FALSE];
        [self.view addSubview:eyesScrollMenu];
        
        [closeMenu setHidden:FALSE];
        [closeMenu setEnabled:TRUE];
        [closeMenu setBackgroundImage:closeMenuImage forState:UIControlStateNormal];
        [closeMenu setBackgroundImage:closeMenuImageGlow forState:UIControlStateHighlighted];
        [self.view addSubview:closeMenu];
        
        [self.view addSubview:stg2BoxHeader];
        
        [menuButton setEnabled:FALSE];
        
        // Set the bools to true
        eyesItemsVisible = TRUE;
        
    } else {
        [self closeItemMenu:sender];
    }
}

- (void)viewMouth:(id)sender {
    if (mouthItemsVisible == FALSE) {
        
        // Make the menu appear on the screen quite suddenly.
        [itemMenus setHidden:FALSE];
        [self.view addSubview:itemMenus];
        
        // Make the scroll menu appear inside the item menu
        [mouthScrollMenu setHidden:FALSE];
        [self.view addSubview:mouthScrollMenu];
        
        [closeMenu setHidden:FALSE];
        [closeMenu setEnabled:TRUE];
        [closeMenu setBackgroundImage:closeMenuImage forState:UIControlStateNormal];
        [closeMenu setBackgroundImage:closeMenuImageGlow forState:UIControlStateHighlighted];
        [self.view addSubview:closeMenu];
        
        [self.view addSubview:stg3BoxHeader];
        
        [menuButton setEnabled:FALSE];
        
        // Set the bools to true
        mouthItemsVisible = TRUE;
        
    } else {
        [self closeItemMenu:sender];
    }
}

- (void)viewHair:(id)sender {
    if (hairItemsVisible == FALSE) {
        
        // Make the menu appear on the screen quite suddenly.
        [itemMenus setHidden:FALSE];
        [self.view addSubview:itemMenus];
        
        // Make the scroll menu appear inside the item menu
        [hairScrollMenu setHidden:FALSE];
        [self.view addSubview:hairScrollMenu];
        
        [closeMenu setHidden:FALSE];
        [closeMenu setEnabled:TRUE];
        [closeMenu setBackgroundImage:closeMenuImage forState:UIControlStateNormal];
        [closeMenu setBackgroundImage:closeMenuImageGlow forState:UIControlStateHighlighted];
        [self.view addSubview:closeMenu];
        
        [self.view addSubview:stg4BoxHeader];
        
        [menuButton setEnabled:FALSE];
        
        // Set the bools to true
        hairItemsVisible = TRUE;
        
    } else {
        [self closeItemMenu:sender];
    }
}

- (void)viewFeet:(id)sender {
    if (feetItemsVisible == FALSE) {
        
        // Make the menu appear on the screen quite suddenly.
        [itemMenus setHidden:FALSE];
        [self.view addSubview:itemMenus];
        
        // Make the scroll menu appear inside the item menu
        [feetScrollMenu setHidden:FALSE];
        [self.view addSubview:feetScrollMenu];
        
        [closeMenu setHidden:FALSE];
        [closeMenu setEnabled:TRUE];
        [closeMenu setBackgroundImage:closeMenuImage forState:UIControlStateNormal];
        [closeMenu setBackgroundImage:closeMenuImageGlow forState:UIControlStateHighlighted];
        [self.view addSubview:closeMenu];
        
        [self.view addSubview:stg5BoxHeader];
        
        [menuButton setEnabled:FALSE];
        
        // Set the bools to true
        feetItemsVisible = TRUE;
        
    } else {
        [self closeItemMenu:sender];
    }
}

#pragma mark methods showing the relevant object menus end

// This methods shows the menu for the user to enter their email address
// and submit their details to the client for market research.
- (void)viewDetail:(id)sender {
    if (detailsMenuVisible == FALSE) {
        
        // Make the menu appear on the screen quite suddenly.
        [itemMenus setHidden:FALSE];
        [self.view addSubview:itemMenus];
        
        [self.view addSubview:detailsBoxHeader];
        
        yourName = [[UILabel alloc] initWithFrame:CGRectMake(35, 78, 100, 20)];
        yourName.text = @"Your Name";
        yourName.textColor = [UIColor whiteColor];
        yourName.backgroundColor = [UIColor clearColor];
        [self.view addSubview:yourName];
        
        yourNameTF = [[UITextField alloc] initWithFrame:CGRectMake(35, 103, 252, 25)];
        yourNameTF.textColor = [UIColor blackColor];
        yourNameTF.backgroundColor = [UIColor whiteColor];
        [yourNameTF setReturnKeyType:UIReturnKeyDone];
        [self.view addSubview:yourNameTF];
        
        UITapGestureRecognizer *itemMenuTGR = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self
                                               action: @selector(hideKeyboard:)];
        
        [itemMenuTGR setNumberOfTouchesRequired:1];
        //itemMenuTGR.delegate = self;
        //Don't forget to set the userInteractionEnabled to YES, by default It's NO.
        [self.view setUserInteractionEnabled:YES];
        itemMenuTGR.cancelsTouchesInView = NO;
        [self.view addGestureRecognizer:itemMenuTGR];
        
        yolkelName = [[UILabel alloc] initWithFrame:CGRectMake(35, 138, 100, 20)];
        yolkelName.text = @"Yolkel Name";
        yolkelName.textColor = [UIColor whiteColor];
        yolkelName.backgroundColor = [UIColor clearColor];
        [self.view addSubview:yolkelName];
        
        yolkelNameTF = [[UITextField alloc] initWithFrame:CGRectMake(35, 163, 252, 25)];
        yolkelNameTF.textColor = [UIColor blackColor];
        yolkelNameTF.backgroundColor = [UIColor whiteColor];
        [yolkelNameTF setReturnKeyType:UIReturnKeyDone];
        [self.view addSubview:yolkelNameTF];
        
        email = [[UILabel alloc] initWithFrame:CGRectMake(35, 198, 100, 20)];
        email.text = @"Email";
        email.textColor = [UIColor whiteColor];
        email.backgroundColor = [UIColor clearColor];
        [self.view addSubview:email];
        
        emailTF = [[UITextField alloc] initWithFrame:CGRectMake(35, 223, 252, 25)];
        emailTF.textColor = [UIColor blackColor];
        emailTF.backgroundColor = [UIColor whiteColor];
        [emailTF setReturnKeyType:UIReturnKeyDone];
        [self.view addSubview:emailTF];
        
        county = [[UILabel alloc] initWithFrame:CGRectMake(35, 258, 150, 20)];
        county.text = @"County (UK Only)";
        county.textColor = [UIColor whiteColor];
        county.backgroundColor = [UIColor clearColor];
        [self.view addSubview:county];
        
        countyTF = [[UITextField alloc] initWithFrame:CGRectMake(35, 283, 252, 25)];
        countyTF.textColor = [UIColor blackColor];
        countyTF.backgroundColor = [UIColor whiteColor];
        [countyTF setReturnKeyType:UIReturnKeyDone];
        [self.view addSubview:countyTF];
        
        [submit setHidden:FALSE];
        [submit setEnabled:TRUE];
        submit.frame = CGRectMake(35, 323, 252, 37);
        [self.view addSubview:submit];
        
        [noSubmit setHidden:FALSE];
        noSubmit.frame = CGRectMake(35, 383, 252, 37);
        [self.view addSubview:noSubmit];
        
        [menuButton setEnabled:FALSE];
        
        // Set the bools to true
        detailsMenuVisible = TRUE;
        
    } else {
        [self closeItemMenu:sender];
    }
}

// This method hides the keyboard when the user clicks away from the
// text field.
- (void)hideKeyboard:(id)sender {
    [yourNameTF resignFirstResponder];
    [yolkelNameTF resignFirstResponder];
    [emailTF resignFirstResponder];
    [countyTF resignFirstResponder];
}

// The following two methods allow for the sending of emails
// via iOS's MFMail client whilst inputting the data previously entered
// on the details form.

- (IBAction)Email:(id)Sender {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"jonathon.albert@live.com", nil]];
        [composer setSubject:@"Cluckhen Brilliant User Details"];
        [composer setMessageBody:[NSString stringWithFormat:@"%@\n%@\n%@\n%@",yourNameTF.text, yolkelNameTF.text, emailTF.text, countyTF.text ] isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [composer setEditing:NO];
        [self presentModalViewController:composer animated:YES];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"error %@", [error description]] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        [self dismissModalViewControllerAnimated:YES];
    }
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark methods showing the relevant object menus finish

// This method shows the share menu which includes facebook, twitter and
// the ability to save an image of your created character to the device.

- (void)viewShare:(id)sender {
    if (shareMenuVisible == FALSE) {
        
        // Make the menu appear on the screen quite suddenly.
        [itemMenus setHidden:FALSE];
        [self.view addSubview:itemMenus];
        
        [closeMenu setHidden:FALSE];
        [closeMenu setEnabled:TRUE];
        [closeMenu setBackgroundImage:closeMenuImage forState:UIControlStateNormal];
        [closeMenu setBackgroundImage:closeMenuImageGlow forState:UIControlStateHighlighted];
        [self.view addSubview:closeMenu];
        
        [self.view addSubview:shareBoxHeader];
        
        // 3 Buttons, one for Twitter, Facebook and to save the image to iphone
        [facebook setHidden:FALSE];
        [facebook setEnabled:TRUE];
        facebook.frame = CGRectMake(35, 80, 252, 37);
        [self.view addSubview:facebook];
        
        [twitter setHidden:FALSE];
        [twitter setEnabled:TRUE];
        twitter.frame = CGRectMake(35, 140, 252, 37);
        [self.view addSubview:twitter];
        
        [saveToPhone setHidden:FALSE];
        [saveToPhone setEnabled:TRUE];
        saveToPhone.frame = CGRectMake(35, 200, 252, 37);
        [self.view addSubview:saveToPhone];
        
        [menuButton setEnabled:FALSE];
        
        // Set the bools to true
        shareMenuVisible = TRUE;
        
    } else {
        [self closeItemMenu:sender];
    }
}

// The following two methods control facebook and twitter integration
// allowing the user to post a status/pic.

// *NOTE* facebook only works on ios6. explained in more detail
// at the top of the file.

- (IBAction)Facebook:(id)sender {
    /*
     ACAccountStore *accountStore = [[ACAccountStore alloc] init];
     ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierFacebook];
     
     [accountStore requestAccessToAccountsWithType:accountType withCompletionHandler:^(BOOL granted, NSError *error) {
     
     ACAccount *account = [[ACAccount alloc] initWithAccountType:accountType];
     NSLog(@"%@, %@", account.username, account.description);
     }];
     
     if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
     
     SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
     
     SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result){
     if (result == SLComposeViewControllerResultCancelled) {
     
     NSLog(@"Cancelled");
     
     } else
     
     {
     NSLog(@"Done");
     }
     
     [controller dismissViewControllerAnimated:YES completion:Nil];
     };
     controller.completionHandler = myBlock;
     
     [controller setInitialText:@"Post to Facebook"];
     
     [self presentViewController:controller animated:YES completion:Nil];
     
     } else {
     NSLog(@"UnAvailable");
     }
     */
}

- (IBAction)Twitter:(id)sender {
    //NSLog(@"Twitter!");
    
    if ([TWTweetComposeViewController canSendTweet]) {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:@"Check out this sweet new app for Cluckhen Brilliant Eggs! :)"];
        [self presentModalViewController:tweetSheet animated:YES];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                            message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
}

// The following two methods allow the user to save their created char
// to the device, it does this by hiding objects on screen so only the
// character is visible and uses the screen as the target of the save.
// Then makes what was on screen visible again e.g. menu bars

- (IBAction)saveToPhone:(id)sender {
    
    // Determine the size of the screenshot required. [entire screen].
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    // Once the close item menu button is pressed,
    
    // Hide everything that doesnt need to be in the screeshot.
    [itemMenus setHidden:TRUE];
    [closeMenu setHidden:TRUE];
    [shareBoxHeader setHidden:TRUE];
    [leftButton setHidden:TRUE];
    [rightButton setHidden:TRUE];
    [menuButton setHidden:TRUE];
    [bottomBar setHidden:TRUE];
    
    // Hide the buttons from the share menu
    [facebook setHidden:TRUE];
    [twitter setHidden:TRUE];
    [saveToPhone setHidden:TRUE];
    
    // Create the screenshot
    UIGraphicsBeginImageContext(size);
    // Put everything in the current view in the screenshot
    [[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    // Save the current image context to a UIImage.
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsGetCurrentContext();
    
    // Save the image to the devices photo album.
    UIImageWriteToSavedPhotosAlbum(screenShot, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // Show everything again after the screenshot has been taken.
    [itemMenus setHidden:FALSE];
    [closeMenu setHidden:FALSE];
    [shareBoxHeader setHidden:FALSE];
    [leftButton setHidden:FALSE];
    [rightButton setHidden:FALSE];
    [menuButton setHidden:FALSE];
    [bottomBar setHidden:FALSE];
    
    // Show the buttons from the share menu
    [facebook setHidden:FALSE];
    [twitter setHidden:FALSE];
    [saveToPhone setHidden:FALSE];
    
    UIAlertView *complete = [[UIAlertView alloc] initWithTitle:@"Saved"
                                                       message:@"Your yolkel has been saved to your images"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
    [complete setTag:2];
    [complete show];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    // callback for UIImageWriteToSavedPhotosAlbum
    
    if (error) {
        // Handle if the image could not be saved to the photo album
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"error %@", [error description]] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
    else {
        // The save was successful and all is well
    }
}

// The following two methods control the option to start again.
// it shows an alertview giving the option to return to the previous
// screen or start again.

- (void)startAgain:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?" message:@"Are you sure you would like to start again?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert setTag:1];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1) {
        if (buttonIndex == 0) {
            NSLog(@"Go Tapped.");
            eggCreationStartScreen *eggScreen = [self.storyboard    instantiateViewControllerWithIdentifier:@"MainMenuView"];
            [self presentModalViewController:eggScreen animated:YES];
            
        } else if (buttonIndex == 1) {
            NSLog(@"Cancel tapped.");
        }
    }
}

#pragma mark methods to show specified menu start

- (void)layoutSkinScrollImages {
    
    // Load the images into the scroll menu.
    if (!skinItemsVisible) {
        for (int i = 1; i <= hisNumImages; i++) {
            //for each image get the imagename, create a new image using imagename, then create a new imageView using the created image.
            imageSkinName = [NSString stringWithFormat:@"EggSkin%d.png", i];
            imageSkin = [UIImage imageNamed:imageSkinName];
            imageViewSkin = [[UIImageView alloc] initWithImage:imageSkin];
            
            //Set the size of the rect that the image will occupy
            CGRect rect = imageViewSkin.frame;
            rect.size.width = hisImageWidth;
            rect.size.height = hisImageHeight;
            imageViewSkin.frame = rect;
            [imageViewSkin setTag:i];
            
            // Tap gesture recogniser for each image so that it can be clicked.
            UITapGestureRecognizer *skinTapRecognizer = [[UITapGestureRecognizer alloc]
                                                         initWithTarget:self
                                                         action:@selector(ClickEventSkinImage:)];
            
            [skinTapRecognizer setNumberOfTouchesRequired:1];
            //[skinTapRecognizer setDelegate:self];
            //Don't forget to set the userInteractionEnabled to YES, by default It's NO.
            imageViewSkin.userInteractionEnabled = YES;
            [imageViewSkin addGestureRecognizer:skinTapRecognizer];
            
            // Add this image as a subview of the scroll menu
            [skinScrollMenu addSubview:imageViewSkin];
        }
        subviewsSkin = [skinScrollMenu subviews];
        
        //repos images in subview
        CGFloat curYLoc = 10;
        
        for (viewSkin in subviewsSkin) {
            if([viewSkin isKindOfClass:[UIImageView class]] && viewSkin.tag > 0)
            {
                CGRect frame = viewSkin.frame;
                frame.origin = CGPointMake(2, curYLoc += 25);
                viewSkin.frame = frame;
                
                curYLoc += 100;
            }
        }
        [skinScrollMenu setContentSize:CGSizeMake([skinScrollMenu bounds].size.width, (400))];
    }
}

- (void)layoutEyesScrollImages {
    
    // Load the images into the scroll menu.
    if (!eyesItemsVisible) {
        for (int i = 1; i <= hisNumImages; i++) {
            //for each image get the imagename, create a new image using imagename, then create a new imageView using the created image.
            imageEyesName = [NSString stringWithFormat:@"MenuEyes%d.png", i];
            imageEyes = [UIImage imageNamed:imageEyesName];
            imageViewEyes = [[UIImageView alloc] initWithImage:imageEyes];
            
            //Set the size of the rect that the image will occupy
            CGRect rect = imageViewEyes.frame;
            rect.size.width = hisImageWidth;
            rect.size.height = hisImageHeight;
            imageViewEyes.frame = rect;
            [imageViewEyes setTag:i];
            
            // Tap gesture recogniser for each image so that it can be clicked.
            UITapGestureRecognizer *eyeTapRecognizer = [[UITapGestureRecognizer alloc]
                                                        initWithTarget:self
                                                        action:@selector(ClickEventEyeImage:)];
            
            [eyeTapRecognizer setNumberOfTouchesRequired:1];
            //[eyeTapRecognizer setDelegate:self];
            //Don't forget to set the userInteractionEnabled to YES, by default It's NO.
            imageViewEyes.userInteractionEnabled = YES;
            [imageViewEyes addGestureRecognizer:eyeTapRecognizer];
            
            // Add this image as a subview of the scroll menu
            [eyesScrollMenu addSubview:imageViewEyes];
        }
        subviewsEyes = [eyesScrollMenu subviews];
        
        //repos images in subview
        CGFloat curYLoc = 10;
        
        for (viewEyes in subviewsEyes) {
            if([viewEyes isKindOfClass:[UIImageView class]] && viewEyes.tag > 0)
            {
                CGRect frame = viewEyes.frame;
                frame.origin = CGPointMake(2, curYLoc += 25);
                viewEyes.frame = frame;
                
                curYLoc += 100;
            }
        }
        [eyesScrollMenu setContentSize:CGSizeMake([eyesScrollMenu bounds].size.width, (hisNumImages * hisImageHeight + (hisNumImages * hisImageHeight) - 290))];
    }
}

- (void)layoutMouthScrollImages {
    
    // Initialise variables
    NSString *imageMouthName = nil;
    UIImage *imageMouth = nil;
    UIImageView *imageViewMouth = nil;
    UIImageView *viewMouth = nil;
    NSArray *subviewsMouth = nil;
    
    // Load the images into the scroll menu.
    if (!mouthItemsVisible) {
        for (int i = 1; i <= hisNumImages; i++) {
            //for each image get the imagename, create a new image using imagename, then create a new imageView using the created image.
            imageMouthName = [NSString stringWithFormat:@"MenuMouth%d.png", i];
            imageMouth = [UIImage imageNamed:imageMouthName];
            imageViewMouth = [[UIImageView alloc] initWithImage:imageMouth];
            
            //Set the size of the rect that the image will occupy
            CGRect rect = imageViewMouth.frame;
            rect.size.width = hisImageWidth;
            rect.size.height = hisImageHeight;
            imageViewMouth.frame = rect;
            [imageViewMouth setTag:i];
            
            // Tap gesture recogniser for each image so that it can be clicked.
            UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(ClickEventMouthImage:)];
            
            [tapRecognizer setNumberOfTouchesRequired:1];
            //[tapRecognizer setDelegate:self];
            //Don't forget to set the userInteractionEnabled to YES, by default It's NO.
            imageViewMouth.userInteractionEnabled = YES;
            [imageViewMouth addGestureRecognizer:tapRecognizer];
            
            // Add this image as a subview of the scroll menu
            [mouthScrollMenu addSubview:imageViewMouth];
        }
        subviewsMouth = [mouthScrollMenu subviews];
        
        //repos images in subview
        CGFloat curYLoc = 10;
        
        for (viewMouth in subviewsMouth) {
            if([viewMouth isKindOfClass:[UIImageView class]] && viewMouth.tag > 0)
            {
                CGRect frame = viewMouth.frame;
                frame.origin = CGPointMake(2, curYLoc += 25);
                viewMouth.frame = frame;
                
                curYLoc += 100;
            }
        }
        [mouthScrollMenu setContentSize:CGSizeMake([mouthScrollMenu bounds].size.width, (hisNumImages * hisImageHeight + (hisNumImages * hisImageHeight) - 290))];
    }
}

- (void)layoutHairScrollImages {

    // Initialise variables
    NSString *imageHairName = nil;
    UIImage *imageHair = nil;
    UIImageView *imageViewHair = nil;
    UIImageView *viewHair = nil;
    NSArray *subviewsHair = nil;
    
    // Load the images into the scroll menu.
    if (!hairItemsVisible) {
        for (int i = 1; i <= hisNumImages; i++) {
            //for each image get the imagename, create a new image using imagename, then create a new imageView using the created image.
            imageHairName = [NSString stringWithFormat:@"MenuHair%d.png", i];
            imageHair = [UIImage imageNamed:imageHairName];
            imageViewHair = [[UIImageView alloc] initWithImage:imageHair];
            
            //Set the size of the rect that the image will occupy
            CGRect rect = imageViewHair.frame;
            rect.size.width = hisImageWidth;
            rect.size.height = hisImageHeight;
            imageViewHair.frame = rect;
            [imageViewHair setTag:i];
            
            // Tap gesture recogniser for each image so that it can be clicked.
            UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(ClickEventHairImage:)];
            
            [tapRecognizer setNumberOfTouchesRequired:1];
            //[tapRecognizer setDelegate:self];
            //Don't forget to set the userInteractionEnabled to YES, by default It's NO.
            imageViewHair.userInteractionEnabled = YES;
            [imageViewHair addGestureRecognizer:tapRecognizer];
            
            // Add this image as a subview of the scroll menu
            [hairScrollMenu addSubview:imageViewHair];
        }
        subviewsHair = [hairScrollMenu subviews];
        
        //repos images in subview
        CGFloat curYLoc = 10;
        
        for (viewHair in subviewsHair) {
            if([viewHair isKindOfClass:[UIImageView class]] && viewHair.tag > 0)
            {
                CGRect frame = viewHair.frame;
                frame.origin = CGPointMake(2, curYLoc += 25);
                viewHair.frame = frame;
                
                curYLoc += 100;
            }
        }
        [hairScrollMenu setContentSize:CGSizeMake([hairScrollMenu bounds].size.width, (hisNumImages * hisImageHeight + (hisNumImages * hisImageHeight) - 290))];
    }
}

- (void)layoutFeetScrollImages {

    // Initialise variables
    NSString *imageFeetName = nil;
    UIImage *imageFeet = nil;
    UIImageView *imageViewFeet = nil;
    UIImageView *viewFeet = nil;
    NSArray *subviewsFeet = nil;
    
    // Load the images into the scroll menu.
    if (!feetItemsVisible) {
        for (int i = 1; i <= hisNumImages; i++) {
            //for each image get the imagename, create a new image using imagename, then create a new imageView using the created image.
            imageFeetName = [NSString stringWithFormat:@"MenuFeet%d.png", i];
            imageFeet = [UIImage imageNamed:imageFeetName];
            imageViewFeet = [[UIImageView alloc] initWithImage:imageFeet];
            
            //menuDiv = [UIImage imageNamed:@"menuDivider.png"];
            //menuDivider = [[UIImageView alloc] initWithImage:menuDiv];
            
            //Set the size of the rect that the image will occupy
            CGRect rect = imageViewFeet.frame;
            rect.size.width = hisImageWidth;
            rect.size.height = hisImageHeight;
            imageViewFeet.frame = rect;
            [imageViewFeet setTag:i];
            
            // Tap gesture recogniser for each image so that it can be clicked.
            UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(ClickEventFeetImage:)];
            
            [tapRecognizer setNumberOfTouchesRequired:1];
            //[tapRecognizer setDelegate:self];
            //Don't forget to set the userInteractionEnabled to YES, by default It's NO.
            imageViewFeet.userInteractionEnabled = YES;
            [imageViewFeet addGestureRecognizer:tapRecognizer];
            
            // Add these images as a subview of the scroll menu
            [feetScrollMenu addSubview:imageViewFeet];
            [feetScrollMenu addSubview:menuDivider];
        }
        subviewsFeet = [feetScrollMenu subviews];
        
        //repos images in subview
        CGFloat curYLoc = 10;
        
        for (viewFeet in subviewsFeet) {
            if([viewFeet isKindOfClass:[UIImageView class]] && viewFeet.tag > 0)
            {
                CGRect frame = viewFeet.frame;
                frame.origin = CGPointMake(2, curYLoc += 25);
                viewFeet.frame = frame;
                
                curYLoc += 100;
            }
        }
        [feetScrollMenu setContentSize:CGSizeMake([feetScrollMenu bounds].size.width, (hisNumImages * hisImageHeight + (hisNumImages * hisImageHeight) - 290))];
    }
}

#pragma mark methods to show specified menu finsh

#pragma mark methods to place chosen objects on the char start

- (void)ClickEventSkinImage:(id)Sender {
    [BaseBody setHidden:YES];
    [BaseBody removeFromSuperview];
    [playerBodyImageView setImage:blnk];
    int imageNum = (((UIGestureRecognizer *)Sender).view).tag;
    playerBodyImageName = [NSString stringWithFormat:@"Egg%d.png", imageNum];
    playerBodyImage = [UIImage imageNamed:playerBodyImageName];
    playerBodyImageView = [[UIImageView alloc] initWithImage:playerBodyImage];
    playerBodyImageView.frame = CGRectMake(0, 0, 320, 480);
    [playerBodyImageView setHidden:TRUE];
    [self.view addSubview:playerBodyImageView];
    
    [tutView setHidden:TRUE];
    [self closeItemMenu:Sender];
    
}

- (void)ClickEventEyeImage:(id)Sender {
    [playerEyesImageView setImage:blnk];
    int imageNum = (((UIGestureRecognizer *)Sender).view).tag;
    playerEyesImageName = [NSString stringWithFormat:@"MainEyes%d.png", imageNum];
    playerEyesImage = [UIImage imageNamed:playerEyesImageName];
    playerEyesImageView = [[UIImageView alloc] initWithImage:playerEyesImage];
    playerEyesImageView.frame = CGRectMake(0, 0, 320, 480);
    [playerEyesImageView setHidden:TRUE];
    [self.view addSubview:playerEyesImageView];
    [self closeItemMenu:Sender];
    
    [tutView setHidden:TRUE];
    
}

- (void)ClickEventMouthImage:(id)Sender {
    [playerMouthImageView setImage:blnk];
    int imageNum = (((UIGestureRecognizer *)Sender).view).tag;
    playerMouthImageName = [NSString stringWithFormat:@"MainMouth%d.png", imageNum];
    playerMouthImage = [UIImage imageNamed:playerMouthImageName];
    playerMouthImageView = [[UIImageView alloc] initWithImage:playerMouthImage];
    playerMouthImageView.frame = CGRectMake(0, 0, 320, 480);
    [playerMouthImageView setHidden:TRUE];
    [self.view addSubview:playerMouthImageView];
    [self closeItemMenu:Sender];
    
    [tutView setHidden:TRUE];
    
}

- (void)ClickEventHairImage:(id)Sender {
    [playerHairImageView setImage:blnk];
    int imageNum = (((UIGestureRecognizer *)Sender).view).tag;
    playerHairImageName = [NSString stringWithFormat:@"MainHair%d.png", imageNum];
    playerHairImage = [UIImage imageNamed:playerHairImageName];
    playerHairImageView = [[UIImageView alloc] initWithImage:playerHairImage];
    playerHairImageView.frame = CGRectMake(0, 0, 320, 480);
    [playerHairImageView setHidden:TRUE];
    [self.view addSubview:playerHairImageView];
    [self closeItemMenu:Sender];
    
    [tutView setHidden:TRUE];
    
}

- (void)ClickEventFeetImage:(id)Sender {
    [BaseFeet setHidden:YES];
    [BaseFeet removeFromSuperview];
    [playerFeetImageView setImage:blnk];
    int imageNum = (((UIGestureRecognizer *)Sender).view).tag;
    playerFeetImageName = [NSString stringWithFormat:@"MainFeet%d.png", imageNum];
    playerFeetImage = [UIImage imageNamed:playerFeetImageName];
    playerFeetImageView = [[UIImageView alloc] initWithImage:playerFeetImage];
    playerFeetImageView.frame = CGRectMake(0, 0, 320, 480);
    [playerFeetImageView setHidden:TRUE];
    [self.view addSubview:playerFeetImageView];
    [self closeItemMenu:Sender];
    
    [tutView setHidden:TRUE];
    
}

#pragma mark methods to place chosen objects on the char ends

// This method closes the item menu clearing and hiding objects
// which shouldnt be seen but are still needed.
- (IBAction)closeItemMenu:(id)sender {
    // Once the close item menu button is pressed,
    // hide itemmenus and close menu button as well as
    // re-enable the menu button and remove the item menu from the list
    // of sub-views.
    [tutView setHidden:TRUE];
    
    [itemMenus setHidden:TRUE];
    [itemMenus removeFromSuperview];
    
    [closeMenu setHidden:TRUE];
    [closeMenu removeFromSuperview];
    
    [startAgain setHidden:TRUE];
    [startAgain setEnabled:FALSE];
    
    [skinScrollMenu setHidden:TRUE];
    [skinScrollMenu removeFromSuperview];
    
    [eyesScrollMenu setHidden:TRUE];
    [eyesScrollMenu removeFromSuperview];
    
    [mouthScrollMenu setHidden:TRUE];
    [mouthScrollMenu removeFromSuperview];
    
    [hairScrollMenu setHidden:TRUE];
    [hairScrollMenu removeFromSuperview];
    
    [feetScrollMenu setHidden:TRUE];
    [feetScrollMenu removeFromSuperview];
    
    [menuButton setEnabled:TRUE];
    
    // Make the part that the player chooses visible on the main screen
    // but no where else.
    [playerBodyImageView setHidden:FALSE];
    [playerEyesImageView setHidden:FALSE];
    [playerMouthImageView setHidden:FALSE];
    [playerHairImageView setHidden:FALSE];
    [playerFeetImageView setHidden:FALSE];
    
    [self.view bringSubviewToFront:playerEyesImageView];
    [self.view bringSubviewToFront:playerMouthImageView];
    [self.view bringSubviewToFront:playerHairImageView];
    [self.view insertSubview:playerFeetImageView aboveSubview:playerBodyImageView];
    
    [stg1BoxHeader removeFromSuperview];
    [stg2BoxHeader removeFromSuperview];
    [stg3BoxHeader removeFromSuperview];
    [stg4BoxHeader removeFromSuperview];
    [stg5BoxHeader removeFromSuperview];
    [detailsBoxHeader removeFromSuperview];
    [shareBoxHeader removeFromSuperview];
    [closeBoxHeader removeFromSuperview];
    
    // Labels, textfields and buttons for details form
    [yourName removeFromSuperview];
    [yourNameTF removeFromSuperview];
    [yolkelName removeFromSuperview];
    [yolkelNameTF removeFromSuperview];
    [email removeFromSuperview];
    [emailTF removeFromSuperview];
    [county removeFromSuperview];
    [countyTF removeFromSuperview];
    [submit removeFromSuperview];
    [noSubmit removeFromSuperview];
    
    // Hide the buttons from the share menu
    [facebook removeFromSuperview];
    [twitter removeFromSuperview];
    [saveToPhone removeFromSuperview];
    
    skinItemsVisible = FALSE;
    eyesItemsVisible = FALSE;
    mouthItemsVisible = FALSE;
    hairItemsVisible = FALSE;
    feetItemsVisible = FALSE;
    detailsMenuVisible = FALSE;
    shareMenuVisible = FALSE;
    closeMenuVisible = FALSE;
}

// This method clears all initialised variables to nil.
- (void)clearAll {
    
    bottomBar = nil;
    leftButton = nil;
    rightButton = nil;
    menuButton = nil;
    leftArrow = nil;
    leftArrowGlow = nil;
    rightArrow = nil;
    rightArrowGlow = nil;
    stg1Bar = nil;
    stg1BarGlow = nil;
    stg1BH = nil;
    stg1BoxHeader = nil;
    stg2Bar = nil;
    stg2BarGlow = nil;
    stg2BH = nil;
    stg2BoxHeader = nil;
    stg3Bar = nil;
    stg3BarGlow = nil;
    stg3BH = nil;
    stg3BoxHeader = nil;
    stg4Bar = nil;
    stg4BarGlow = nil;
    stg4BH = nil;
    stg4BoxHeader = nil;
    stg5Bar = nil;
    stg5BarGlow = nil;
    stg5BH = nil;
    stg5BoxHeader = nil;
    detailsBar = nil;
    detailsBarBlur = nil;
    detailsBH = nil;
    detailsBoxHeader = nil;
    shareBar = nil;
    shareBarBlur = nil;
    shareBH = nil;
    shareBoxHeader = nil;
    closeBar = nil;
    closeBarBlur = nil;
    closeBH = nil;
    closeBoxHeader = nil;
    viewSkin = nil;
    closeMenu = nil;
    closeMenuImage = nil;
    closeMenuImageGlow = nil;
    itemMenus = nil;
    skinScrollMenu = nil;
    eyesScrollMenu = nil;
    mouthScrollMenu = nil;
    hairScrollMenu = nil;
    feetScrollMenu = nil;
    viewSkin = nil;
    imageSkinName = nil;
    imageSkin = nil;
    imageViewSkin = nil;
    subviewsSkin = nil;
    playerBodyImageName = nil;
    playerBodyImage = nil;
    playerBodyImageView = nil;
    playerEyesImageName = nil;
    playerEyesImage = nil;
    playerEyesImageView = nil;
    playerMouthImageName = nil;
    playerMouthImage = nil;
    playerMouthImageView = nil;
    playerHairImageName = nil;
    playerHairImage = nil;
    playerHairImageView = nil;
    playerFeetImageName = nil;
    playerFeetImage = nil;
    playerFeetImageView = nil;
    blnk = nil;
    yourName = nil;
    yourNameTF = nil;
    yolkelName = nil;
    yolkelNameTF = nil;
    email = nil;
    emailTF = nil;
    county = nil;
    countyTF = nil;
    submit = nil;
    noSubmit = nil;
    facebook = nil;
    twitter = nil;
    saveToPhone = nil;
    menuDivider = nil;
    menuDiv = nil;
    startAgain = nil;
    BBody = nil;
    BaseBody = nil;
    BFeet = nil;
    BaseFeet = nil;
    shdw = nil;
    charShadow = nil;
    tut = nil;
    tutView = nil;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
