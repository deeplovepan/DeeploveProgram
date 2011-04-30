//
//  HorizontalPageScrollViewController.m
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HorizontalPageScrollViewController.h"
#import "HorizontalPageScrollContentViewController.h"

@implementation HorizontalPageScrollViewController

-(void)removeScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page >= numberOfPages)
        return;
    HorizontalPageScrollContentViewController *controller = [viewControllers objectAtIndex:page];
    if((NSNull*)controller != [NSNull null])
    {
        [controller.view removeFromSuperview];
        [viewControllers replaceObjectAtIndex:page withObject:[NSNull null]];
        
    }
}

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page >= numberOfPages)
        return;
    
    // replace the placeholder if necessary
    HorizontalPageScrollContentViewController *controller = [viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {
        controller = [[HorizontalPageScrollContentViewController alloc] initWithProductDic:productDic page:page size:self.view.frame.size];
        [viewControllers replaceObjectAtIndex:page withObject:controller];
        [controller release];
    }
    
    if (controller.view.superview == nil)
    {
        CGRect frame = self.view.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.view addSubview:controller.view];
        
    }
    
}

-(void)initContentViewController:(NSDictionary*)dic
{
    productDic = dic;
    
    
    
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    
}



-(id)initWithScrollViewFrame:(CGRect)frame contentSize:(CGSize)contentSize numberOfPages:(int)pages
{
    self = [super init];
    if(self)
    {
        numberOfPages = pages;
        
        
        viewControllers = [[NSMutableArray alloc] init];
        for (unsigned i = 0; i < numberOfPages; i++)
        {
            [viewControllers addObject:[NSNull null]];
        }
        
        UIScrollView *horizontalScrollView = [[UIScrollView alloc] initWithFrame:frame];
        horizontalScrollView.pagingEnabled = YES;
        horizontalScrollView.contentSize = contentSize;
        horizontalScrollView.delegate = self;
        self.view = horizontalScrollView;
        [horizontalScrollView release];
        
        
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

- (void)dealloc
{
    [viewControllers release];
    [super dealloc];
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

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    [self removeScrollViewWithPage:page - 2];
    [self removeScrollViewWithPage:page + 2];
    
    
}

@end
