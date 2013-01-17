//
//  MainMenuViewController.h
//  Cluckhen Brilliant
//
//  Created by Jonathon Albert on 07/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVAudioPlayer+PGFade.h"

@interface MainMenuViewController : UIViewController {
    AVAudioPlayer *audioPlayer;
    
    UIButton *him;
    UIButton *her;   
    UIImageView *himEgg;
    UIImageView *herEgg;
    NSString *planeName;
    UIImage *Plane;
    UIImageView *planeView;    
}

@property(nonatomic, retain) UIButton *him;
@property(nonatomic, retain) UIButton *her;

@end

