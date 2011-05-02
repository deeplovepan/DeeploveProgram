//
//  HorizontalPageScrollViewController.h
//  DeeploveProgram
//
//  Created by deeplove on 2011/4/28.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HorizontalPageScrollViewController : UIViewController <UIScrollViewDelegate> {
    int numberOfPages;
    NSMutableArray *viewControllers;
    NSDictionary *productDic;
    
}
-(id)initWithScrollViewFrame:(CGRect)frame contentSize:(CGSize)contentSize numberOfPages:(int)pages;
-(void)initContentViewController:(NSDictionary*)dic;

@end
