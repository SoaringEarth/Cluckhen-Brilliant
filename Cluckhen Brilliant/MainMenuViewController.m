//
//  MainMenuViewController.m
//  Cluckhen Brilliant
//
//  Created by Jonathon Albert on 07/08/2012.
//  Copyright (c) 2012. All rights reserved.
//

// This file controls the gender selection screen and plays audio.

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
@synthesize him, her;

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
    
    planeName = [NSString stringWithFormat:@"YolkelPlane.png"];
    Plane = [UIImage imageNamed:planeName];
    planeView = [[UIImageView alloc] initWithImage:Plane];
    
    // Load the image into the scene
    [self.view addSubview:planeView];    
    planeView.frame = CGRectMake(320, 21, 508, 81); 
    
    // Configure the animation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:2.0];
    [UIView setAnimationDuration:8.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [self.view addSubview:planeView];
    planeView.frame = CGRectMake(-508, 21, 508, 81);
    [UIView commitAnimations];
    
    // Start the animation
    [planeView startAnimating];
    
    //Audio
    // Get the path to the desired audio file. saved as a URL
    NSURL *audioURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/engine.mp3", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:&error];
    audioPlayer.numberOfLoops = 2;
    audioPlayer.volume = 0.2;
    
    if (audioPlayer == nil) {
        [error description];
    } else {
        [audioPlayer playWithFadeDuration:2];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    audioPlayer = nil;
}

-(void)viewWillDisappear:(BOOL)animated {
    [audioPlayer stopWithFadeDuration:2];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
