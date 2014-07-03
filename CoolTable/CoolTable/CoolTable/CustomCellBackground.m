//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by Paul Wilson on 6/12/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"

@implementation CustomCellBackground

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//Draw Red Rectangle
/*
-(void) drawRect: (CGRect) rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    
    CGContextSetFillColorWithColor(context, redColor.CGColor);
    CGContextFillRect(context, self.bounds);
}
*/

//Draw Gradient For Rectangle
-(void) drawRect: (CGRect) rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    //UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]; // NEW
    UIColor * separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0];
    CGRect paperRect = self.bounds;
    
    if (self.selected) {
        drawLinearGradient(context, paperRect, lightGrayColor.CGColor, separatorColor.CGColor);
    } else {
        drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    }
    
    drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
    
    /*
    //Adding a Stroke
    CGRect strokeRect = rectFor1PxStroke(CGRectInset(paperRect, 5.0, 5.0));
    CGContextSetStrokeColorWithColor(context, redColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);
     */
    
    CGRect strokeRect = paperRect;
    strokeRect.size.height -= 1;
    strokeRect = rectFor1PxStroke(strokeRect);
    CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
    
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokeRect(context, strokeRect);
    
    //Draw Seperator
    CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
    if (!self.lastCell) {
        draw1PxStroke(context, startPoint, endPoint, separatorColor.CGColor);
    } else {
        CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        
        CGPoint pointA = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
        CGPoint pointB = CGPointMake(paperRect.origin.x, paperRect.origin.y);
        CGPoint pointC = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y);
        CGPoint pointD = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
        
        draw1PxStroke(context, pointA, pointB, whiteColor.CGColor);
        draw1PxStroke(context, pointB, pointC, whiteColor.CGColor);
        draw1PxStroke(context, pointC, pointD, whiteColor.CGColor);
    }
}



@end
