//
//  FullImageView.m
//  HisCADAPanel
//
//  Created by  on 11/12/12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FullImageView.h"

@implementation FullImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	
		
	if([touch tapCount] == 2) 
	{
        UIScrollView *scrollView = (UIScrollView*)self.superview;
		if(scrollView.zoomScale == 1.0)
		{
            [scrollView setZoomScale:scrollView.maximumZoomScale animated:YES];
		}
		else
		{
            [scrollView setZoomScale:1.0 animated:YES];
		}
	}
	
}


@end
