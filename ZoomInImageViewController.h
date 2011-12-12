//
//  ZoomInImageViewController.h
//  HisCADAPanel
//
//  Created by  on 11/12/12.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomInImageViewController : UIViewController <UIScrollViewDelegate>
{
    CGRect scrollViewFrame;
    float maxZoomRatio;
    FullImageView *imageView;
}
-(id)initWithFrame:(CGRect)frame andMaxRatio:(float)maxRatio;

@end
