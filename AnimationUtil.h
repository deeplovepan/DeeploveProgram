//
//  AnimationUtil.h
//  LuvInCloud
//
//  Created by Sky Chen on 10/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#define SPIN_CLOCK_WISE 1
#define SPIN_COUNTERCLOCK_WISE -1

@interface AnimationUtil : NSObject {
}

+(void)move:(UIView*)view toPos:(CGPoint)pos withDur:(double)time;
+(void)zoom:(UIView*)view toSize:(CGSize)size withDur:(double)time;
+(void)zoomToPos:(UIView*)view toRect:(CGRect)rect withDur:(double)time;
+(void)rotate:(UIView*)view rotateDeg:(double)deg withDur:(double)time;
+(void)rotateToPos:(UIView*)view toPos:(CGPoint)center rotateDeg:(double)deg withDur:(double)time;
-(void)MoveAndReturnToOrigin:(UIView*)view toPos:(CGPoint)pos withDur:(double)time
					withLoop:(NSInteger)loops;
+(void)spinLayer:(CALayer *)inLayer duration:(CFTimeInterval)inDuration
	   direction:(int)direction repeatCount:(float)repeatCount;
+(void)rotateLayerToPos:(CALayer *)inLayer toPos:(CGPoint)pos rotateDegree:(double)deg duration:(CFTimeInterval)inDuration;
+(void)resumeLayerAnimation:(CALayer*)layer;
+(void)stopLayerAnimation:(CALayer*)layer;
+(void)seqAnimation:(NSArray*)imageArray withDur:(double)time withLoopCount:(NSInteger)loops 
		  imageView:(UIImageView*)imageView isStart:(BOOL)isStart;
+(void)move:(UIView*)view toCenter:(CGPoint)pos withDur:(double)time;

@end
