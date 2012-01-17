//
//  MyAudioLib.m
//  DeeploveProgram
//
//  Created by  on 12/1/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyAudioLib.h"

@implementation MyAudioLib

// import <AVFoundation/AVFoundation.h>
//   & <AudioToolbox/AudioServices.h>
+(void)setPlayAndRecordMode
{
    NSError *setCategoryErr = nil;
    NSError *activationErr  = nil;
    //Set the general audio session category
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: &setCategoryErr];
    
    // use following code to resolve volume decrease problem
    //Make the default sound route for the session be to use the speaker
    UInt32 doChangeDefaultRoute = 1;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof (doChangeDefaultRoute), &doChangeDefaultRoute);
    
    //Activate the customized audio session
    [[AVAudioSession sharedInstance] setActive: YES error: &activationErr];

}

@end
