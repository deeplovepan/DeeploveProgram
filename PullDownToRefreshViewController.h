//
//  PullDownToRefreshViewController.h
//  Locomote
//
//  Created by Peter Pan on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// note:
//      remember to include Quartz.Core framework

@interface PullDownToRefreshViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    BOOL isRefresh;
    BOOL isDragging;
    UILabel *refreshLabel;
    NSString *textPull;
    NSString *textRelease;
    NSString *textLoading;
    UIImageView *refreshArrow;
    UIView *refreshHeaderView;
    UIActivityIndicatorView *refreshSpinner;
    BOOL isNoMoreData;

}

@property (strong, nonatomic) UITableView *pullDownToRefreshTableView;



-(void)stopLoading;
-(void)doneLoading;

@end
