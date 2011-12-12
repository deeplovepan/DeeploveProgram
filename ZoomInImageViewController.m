//
//  ZoomInImageViewController.m
//  HisCADAPanel
//
//  Created by  on 11/12/12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ZoomInImageViewController.h"
#import "FullImageView.h"

@implementation ZoomInImageViewController

-(id)initWithFrame:(CGRect)frame andMaxRatio:(float)maxRatio
{
    self = [super init];
    if(self)
    {
        scrollViewFrame = frame;
        maxZoomRatio = maxRatio;
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    scrollView.maximumZoomScale = maxZoomRatio;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView release];
    
    UIImage *image = [UIImage imageNamed:@"image.jpeg"];
    imageView = [[FullImageView alloc] initWithFrame:scrollViewFrame];
    imageView.image = image;
    [scrollView addSubview:imageView];
    [imageView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}


@end
