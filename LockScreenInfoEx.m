//
//  LockScreenInfoEx.m
//  DeeploveProgram
//
//  Created by  on 11/11/19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LockScreenInfoEx.h"

@implementation LockScreenInfoEx

-(void)setLockScreenMusicInfo
{
    MPNowPlayingInfoCenter *playInfo =[MPNowPlayingInfoCenter defaultCenter];
    UIImage *albumArtImage = [UIImage imageNamed:@"Default.png"];
    MPMediaItemArtwork *albumArt = [[MPMediaItemArtwork alloc] initWithImage:albumArtImage];
    NSArray *objs = [NSArray arrayWithObjects:@"我在乎" ,@"戴佩妮", albumArt, nil];
    NSArray *keys = [NSArra arrayWithObjects:
                     MPMediaItemPropertyTitle, MPMediaItemPropertyArtist,
                     MPMediaItemPropertyArtwork, nil];
    playInfo.nowPlayingInfo = [NSDictionary dictionaryWithObjects: objs forKeys:keys];
}

@end
