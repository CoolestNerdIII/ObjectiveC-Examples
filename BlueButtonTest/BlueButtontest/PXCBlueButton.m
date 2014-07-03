//
//  PXCBlueButton.m
//  BlueButtontest
//
//  Created by Peter Krajčík on 18.3.2012.
//  Copyright (c) 2012 SUNTEQ s.r.o. All rights reserved.
//

#import "PXCBlueButton.h"

@interface PXCBlueButton ()
- (void)drawBlueButtonWithButtonColor: (NSColor*) buttonColor pressed: (BOOL)isPressed;
@end

@implementation PXCBlueButton
@synthesize baseColor;
@synthesize flareAlpha;



- (void)drawRect: (NSRect)rect
{
    BOOL isPressed = [[self cell] isHighlighted];
    
    if (isPressed)
        [self drawBlueButtonWithButtonColor: [self.baseColor shadowWithLevel: 0.3] pressed: isPressed];
    else
        [self drawBlueButtonWithButtonColor: self.baseColor pressed: isPressed];
}


- (void)drawBlueButtonWithButtonColor: (NSColor*) buttonColor pressed: (BOOL)isPressed
{
    //// Color Declarations
    
    // Disclaimer: These color declarations were modified a bit to animate the button (self.flareAlpha...)
    // PaintCode does not output animated code by itself.
    NSColor* upColorOut = [NSColor colorWithCalibratedRed: 0.75 green: 0.75 blue: 0.75 alpha: 1];
    NSColor* bottomColorDown = [NSColor colorWithCalibratedRed: 0.16 green: 0.16 blue: 0.16 alpha: 1];
    NSColor* upColorInner = [NSColor colorWithCalibratedRed: 0.13 green: 0.13 blue: 0.15 alpha: 1];
    NSColor* bottomColorInner = [NSColor colorWithCalibratedRed: 0.97 green: 0.98 blue: 0.99 alpha: 1];
    NSColor* buttonTopColor = [buttonColor shadowWithLevel: 0.2];
    NSColor* buttonFlareUpColor = [[buttonColor highlightWithLevel: 0.7] colorWithAlphaComponent: 0.5 + 0.5*self.flareAlpha];
    NSColor* buttonFlareBottomColor = [[buttonColor highlightWithLevel: 0.2] colorWithAlphaComponent: 0.5 + 0.5*self.flareAlpha];
    NSColor* buttonBottomColor = [buttonColor highlightWithLevel: 0.5 + 0.5 * self.flareAlpha];
    NSColor* flareWhite = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 0.83 * self.flareAlpha];
    
        //// Gradient Declarations
    NSGradient* ringGradient = [[NSGradient alloc] initWithStartingColor: upColorOut endingColor: bottomColorDown];
    NSGradient* ringInnerGradient = [[NSGradient alloc] initWithStartingColor: upColorInner endingColor: bottomColorInner];
    NSGradient* buttonGradient = [[NSGradient alloc] initWithStartingColor: buttonBottomColor endingColor: buttonTopColor];
    NSGradient* overlayGradient = [[NSGradient alloc] initWithStartingColor: flareWhite endingColor: [NSColor clearColor]];
    NSGradient* buttonFlareGradient = [[NSGradient alloc] initWithStartingColor: buttonFlareUpColor endingColor: buttonFlareBottomColor];
    
        //// Shadow Declarations
    NSShadow* buttonInnerShadow = [[NSShadow alloc] init];
    [buttonInnerShadow setShadowColor: [NSColor blackColor]];
    [buttonInnerShadow setShadowOffset: NSMakeSize(0, 0)];
    [buttonInnerShadow setShadowBlurRadius: 5];
   
    NSShadow* buttonOuterShadow = [[NSShadow alloc] init];
    [buttonOuterShadow setShadowColor: [NSColor blackColor]];
    [buttonOuterShadow setShadowOffset: NSMakeSize(0, -2)];
    [buttonOuterShadow setShadowBlurRadius: isPressed ? 2 : 5];
    
    
        //// outerOval Drawing
    NSBezierPath* outerOvalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(5, 5, 63, 63)];
    [NSGraphicsContext saveGraphicsState];
    [buttonOuterShadow set];
    [buttonOuterShadow.shadowColor setFill];
    [outerOvalPath fill];
    [ringGradient drawInBezierPath: outerOvalPath angle: 90];
    [NSGraphicsContext restoreGraphicsState];
    
    
    
        //// overlayOval Drawing
    NSBezierPath* overlayOvalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(5, 5, 63, 63)];
    [NSGraphicsContext saveGraphicsState];
    [overlayOvalPath addClip];
    [overlayGradient drawFromCenter: NSMakePoint(36.5, 12.23) radius: 17.75
                           toCenter: NSMakePoint(36.5, 36.5) radius: 44.61
                            options: NSGradientDrawsBeforeStartingLocation | NSGradientDrawsAfterEndingLocation];
    [NSGraphicsContext restoreGraphicsState];
    
    
    
        //// innerOval Drawing
    NSBezierPath* innerOvalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(12, 12, 49, 49)];
    [ringInnerGradient drawInBezierPath: innerOvalPath angle: 90];
    
    
    
        //// buttonOval Drawing
    NSBezierPath* buttonOvalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(14, 13, 46, 46)];
    [NSGraphicsContext saveGraphicsState];
    [buttonOvalPath addClip];
    [buttonGradient drawFromCenter: NSMakePoint(37, 63.23) radius: 2.44
                          toCenter: NSMakePoint(37, 44.48) radius: 23.14
                           options: NSGradientDrawsBeforeStartingLocation | NSGradientDrawsAfterEndingLocation];
    [NSGraphicsContext restoreGraphicsState];
    
        ////// buttonOval Inner Shadow
    NSRect buttonOvalBorderRect = NSInsetRect([buttonOvalPath bounds], -buttonInnerShadow.shadowBlurRadius, -buttonInnerShadow.shadowBlurRadius);
    buttonOvalBorderRect = NSOffsetRect(buttonOvalBorderRect, -buttonInnerShadow.shadowOffset.width, buttonInnerShadow.shadowOffset.height);
    buttonOvalBorderRect = NSInsetRect(NSUnionRect(buttonOvalBorderRect, [buttonOvalPath bounds]), -1, -1);
    
    NSBezierPath* buttonOvalNegativePath = [NSBezierPath bezierPathWithRect: buttonOvalBorderRect];
    [buttonOvalNegativePath appendBezierPath: buttonOvalPath];
    [buttonOvalNegativePath setWindingRule: NSEvenOddWindingRule];
    
    [NSGraphicsContext saveGraphicsState];
    {
    NSShadow* innerShadow = [buttonInnerShadow copy];
    CGFloat xOffset = innerShadow.shadowOffset.width + round(buttonOvalBorderRect.size.width);
    CGFloat yOffset = innerShadow.shadowOffset.height;
    innerShadow.shadowOffset = NSMakeSize(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset));
    [innerShadow set];
    [[NSColor grayColor] setFill];
    [buttonOvalPath addClip];
    NSAffineTransform* transform = [NSAffineTransform transform];
    [transform translateXBy: -round(buttonOvalBorderRect.size.width) yBy: 0];
    [[transform transformBezierPath: buttonOvalNegativePath] fill];
    [innerShadow release];
    }
    [NSGraphicsContext restoreGraphicsState];
    
    
    
    
        //// flareOval Drawing
    NSBezierPath* flareOvalPath = [NSBezierPath bezierPathWithOvalInRect: NSMakeRect(22, 14, 29, 15)];
    [buttonFlareGradient drawInBezierPath: flareOvalPath angle: 90];
    
    
        //// Cleanup
    [buttonInnerShadow release];
    [buttonOuterShadow release];
    [ringGradient release];
    [ringInnerGradient release];
    [buttonGradient release];
    [overlayGradient release];
    [buttonFlareGradient release];
    
}

- (void)setFlareAlpha: (CGFloat)newFlareAlpha
{
    flareAlpha = newFlareAlpha;
    [self setNeedsDisplay: YES];
}

@end
