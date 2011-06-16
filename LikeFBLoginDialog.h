//
//  LikeFBLoginDialog.h
//  FacebookLike
//
//  Created by deeplove on 2011/6/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FB_LIKE_BUTTON_LOGIN_NOTIFICATION @"FBLikeLoginNotification"

typedef enum {
    FBLikeButtonStyleStandard,
    FBLikeButtonStyleButtonCount,
    FBLikeButtonStyleBoxCount
} FBLikeButtonStyle;

typedef enum {
    FBLikeButtonColorLight,
    FBLikeButtonColorDark
} FBLikeButtonColor;

@interface LikeFBLoginDialog : UIView {
    UIWebView *webView_;
    
    UIColor *textColor_;
    UIColor *linkColor_;
    UIColor *buttonColor_;
}
@property(retain) UIColor *textColor;
@property(retain) UIColor *linkColor;
@property(retain) UIColor *buttonColor;

- (id)initWithFrame:(CGRect)frame andUrl:(NSString *)likePage andStyle:(FBLikeButtonStyle)style andColor:(FBLikeButtonColor)color;
- (id)initWithFrame:(CGRect)frame andUrl:(NSString *)likePage;

@end
