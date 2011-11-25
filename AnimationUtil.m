//
//  AnimationUtil.m
//  LuvInCloud
//
//  Created by Sky Chen on 10/8/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AnimationUtil.h"


@implementation AnimationUtil

+(void)move:(UIView*)view toCenter:(CGPoint)pos withDur:(double)time
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:time];
	
	UIViewAnimationCurve curve = UIViewAnimationCurveEaseOut;
	[UIView setAnimationCurve:curve];
	
	view.center = pos;
	
	[UIView commitAnimations];
}



+(void)move:(UIView*)view toPos:(CGPoint)pos withDur:(double)time
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:time];

	UIViewAnimationCurve curve = UIViewAnimationCurveEaseOut;
	[UIView setAnimationCurve:curve];
	
	view.frame = CGRectMake(pos.x, pos.y, view.bounds.size.width, view.bounds.size.height);
	
	[UIView commitAnimations];
}

-(void)MoveAndReturnToOrigin:(UIView*)view toPos:(CGPoint)pos withDur:(double)time
					withLoop:(NSInteger)loops
{
	[UIView beginAnimations:@"MoveAndReturnToOrigin" context:@"move"];
	[UIView setAnimationDuration:time];
	
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:
		@selector(myAnimationStop:finished:context:)];
	
	[UIView commitAnimations];
	
}

+(void)zoom:(UIView*)view toSize:(CGSize)size withDur:(double)time
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:time];
	CGPoint centerPoint = view.center;
	CGRect frame;
	frame.size= size;
	view.frame = frame;
	view.center = centerPoint;
	[UIView commitAnimations];
}

+(void)zoomToPos:(UIView*)view toRect:(CGRect)rect withDur:(double)time
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:time];
	view.frame = rect;
	[UIView commitAnimations];
}

+(void)stopLayerAnimation:(CALayer*)layer
{
	CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

+(void)resumeLayerAnimation:(CALayer*)layer
{
	CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

+(void)spinLayer:(CALayer *)inLayer duration:(CFTimeInterval)inDuration
	   direction:(int)direction repeatCount:(float)repeatCount
{
	CABasicAnimation* rotationAnimation;
	
	// Rotate about the z axis
	rotationAnimation = 
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	
	
	// Rotate 360 degress, in direction specified
	rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * direction];
		
	// Perform the rotation over this many seconds
	rotationAnimation.duration = inDuration;
		
	rotationAnimation.repeatCount = repeatCount;
	
	// Set the pacing of the animation
	rotationAnimation.timingFunction = 
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	// Add animation to the layer and make it so
	[inLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
	
}

+(void)rotateLayerToPos:(CALayer *)inLayer toPos:(CGPoint)pos rotateDegree:(double)deg duration:(CFTimeInterval)inDuration
{
	inLayer.position = pos;
	
	CABasicAnimation* rotationAnimation;
	
	// Rotate about the z axis
	rotationAnimation = 
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	
	
	// Rotate 360 degress, in direction specified
	rotationAnimation.toValue = [NSNumber numberWithFloat: 2*M_PI*deg/360];
	
	// Perform the rotation over this many seconds
	rotationAnimation.duration = inDuration;
	
	rotationAnimation.repeatCount = 1;
	
	// Set the pacing of the animation
	rotationAnimation.timingFunction = 
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
	
	// Add animation to the layer and make it so
	[inLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
	
}

+(void)rotate:(UIView*)view rotateDeg:(double)deg withDur:(double)time
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:time];
	
	view.transform = CGAffineTransformMakeRotation(2*M_PI*deg/360);
	
	
	[UIView commitAnimations];
}

+(void)rotateToPos:(UIView*)view toPos:(CGPoint)center rotateDeg:(double)deg withDur:(double)time
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:time];
	
	view.center = center;
	view.transform = CGAffineTransformMakeRotation(M_PI*deg/180);
	
	[UIView commitAnimations];
}

// imageArray must be image obj
+(void)seqAnimation:(NSArray*)imageArray withDur:(double)time withLoopCount:(NSInteger)loops imageView:(UIImageView*)imageView isStart:(BOOL)isStart
{
	imageView.animationImages = imageArray;
	imageView.animationDuration = time;
	imageView.animationRepeatCount = loops;
    if(isStart)
    {
        [imageView startAnimating];
    }
}


- (void)myAnimationStop:(NSString *)animationID finished:(NSNumber *)finished 
					context:(void *)context
{
	if([animationID isEqualToString:@"MoveAndReturnToOrigin"])
	{
		NSString *action = context;
		if([action isEqualToString:@"move"])
		{
			
		}
		else
		{
			
		}

		

	}
}

@end
