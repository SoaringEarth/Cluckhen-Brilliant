//
//  ViewController.m
//  Cluckhen Brilliant
//
//  Created by Jonathon Albert on 07/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// This is the start screen the user first sees.
// it doesnt do anything apart from get tapped.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
