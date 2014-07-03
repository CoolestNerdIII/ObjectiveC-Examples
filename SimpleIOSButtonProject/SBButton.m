//
//  SBButton.m
//  SimpleIOSButton
//
//  Created by Peter Krajčík on 4.12.2012.
//  Copyright (c) 2012 PixelCut s.r.o. All rights reserved.
//

#import "SBButton.h"

@implementation SBButton



- (void)drawButtonHighlighted: (BOOL)isHighlighted
{
	/// General Declarations
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	
	UIColor* buttonActiveColor = self.buttonColor;
	
	if (!isHighlighted)
		buttonActiveColor = self.buttonHighLightColor;
	
	//// Color Declarations
	UIColor* iconShadow = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.8];
	//UIColor* buttonColor = [UIColor colorWithRed: 0.207 green: 0.676 blue: 0 alpha: 1];
	CGFloat buttonColorRGBA[4];
	[buttonActiveColor getRed: &buttonColorRGBA[0] green: &buttonColorRGBA[1] blue: &buttonColorRGBA[2] alpha: &buttonColorRGBA[3]];
	
	UIColor* baseGradientBottomColor = [UIColor colorWithRed: (buttonColorRGBA[0] * 0.6) green: (buttonColorRGBA[1] * 0.6) blue: (buttonColorRGBA[2] * 0.6) alpha: (buttonColorRGBA[3] * 0.6 + 0.4)];
	UIColor* upperShine = [UIColor colorWithRed: 0.959 green: 0.959 blue: 0.959 alpha: 0.82];
	UIColor* topShine = [upperShine colorWithAlphaComponent: 0.5];
	UIColor* bottomShine = [upperShine colorWithAlphaComponent: 0.1];
	
	//// Gradient Declarations
	NSArray* baseGradientColors = [NSArray arrayWithObjects:
								   (id)buttonActiveColor.CGColor,
								   (id)baseGradientBottomColor.CGColor, nil];
	CGFloat baseGradientLocations[] = {0, 1};
	CGGradientRef baseGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)baseGradientColors, baseGradientLocations);
	NSArray* shineGradientColors = [NSArray arrayWithObjects:
									(id)upperShine.CGColor,
									(id)[UIColor colorWithRed: 0.959 green: 0.959 blue: 0.959 alpha: 0.66].CGColor,
									(id)topShine.CGColor,
									(id)[UIColor colorWithRed: 0.959 green: 0.959 blue: 0.959 alpha: 0.3].CGColor,
									(id)bottomShine.CGColor, nil];
	CGFloat shineGradientLocations[] = {0, 0.05, 0.09, 0.66, 1};
	CGGradientRef shineGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)shineGradientColors, shineGradientLocations);
	
	//// Shadow Declarations
	UIColor* buttonShadow = iconShadow;
	CGSize buttonShadowOffset = CGSizeMake(0.1, 1.1);
	CGFloat buttonShadowBlurRadius = 2;
	
	//// Frames
	//CGRect frame = CGRectMake(0, 0, 229, 38);
	CGRect frame = self.customButton.bounds;

	
	//// Button
	{
		
		//// ButtonRectangle Drawing
		CGRect buttonRectangleRect = CGRectMake(CGRectGetMinX(frame) + 2, CGRectGetMinY(frame) + 1, CGRectGetWidth(frame) - 4, CGRectGetHeight(frame) - 4);
		UIBezierPath* buttonRectanglePath = [UIBezierPath bezierPathWithRoundedRect: buttonRectangleRect cornerRadius: 7];
		CGContextSaveGState(context);
		CGContextSetShadowWithColor(context, buttonShadowOffset, buttonShadowBlurRadius, buttonShadow.CGColor);
		CGContextBeginTransparencyLayer(context, NULL);
		[buttonRectanglePath addClip];
		CGContextDrawLinearGradient(context, baseGradient,
									CGPointMake(CGRectGetMidX(buttonRectangleRect), CGRectGetMinY(buttonRectangleRect)),
									CGPointMake(CGRectGetMidX(buttonRectangleRect), CGRectGetMaxY(buttonRectangleRect)),
									0);
		CGContextEndTransparencyLayer(context);
		CGContextRestoreGState(context);
		
		
		
		//// Rounded Rectangle Drawing
		CGRect roundedRectangleRect = CGRectMake(CGRectGetMinX(frame) + 2, CGRectGetMinY(frame) + 1, CGRectGetWidth(frame) - 4, floor((CGRectGetHeight(frame) - 1) * 0.48649 + 0.5));
		UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: roundedRectangleRect cornerRadius: 7];
		CGContextSaveGState(context);
		[roundedRectanglePath addClip];
		CGContextDrawLinearGradient(context, shineGradient,
									CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMinY(roundedRectangleRect)),
									CGPointMake(CGRectGetMidX(roundedRectangleRect), CGRectGetMaxY(roundedRectangleRect)),
									0);
		CGContextRestoreGState(context);

	}
	
	
	//// Cleanup
	CGGradientRelease(baseGradient);
	CGGradientRelease(shineGradient);
	CGColorSpaceRelease(colorSpace);
}


#pragma mark Overrides


- (void)drawOnState
{
    [self drawButtonHighlighted: YES];
}

- (void)drawOffState
{
    [self drawButtonHighlighted: NO];
}
@end
