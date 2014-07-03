//
//  SBButtonCustomizer.m
//  SimpleIOSButton
//
//  Created by Peter Krajčík on 4.12.2012.
//  Copyright (c) 2012 PixelCut s.r.o. All rights reserved.
//

#import "SBButtonCustomizer.h"

@interface SBButtonCustomizer ()
@property(retain) UIImage* onStateImage;
@property(retain) UIImage* offStateImage;

- (UIImage*)imageForSelector: (SEL)selector;
@end



@implementation SBButtonCustomizer

- (void)awakeFromNib
{
    [super awakeFromNib];

	self.onStateImage = [[self imageForSelector: @selector(drawOnState)] resizableImageWithCapInsets: [self capInsets]];
    self.offStateImage = [[self imageForSelector: @selector(drawOffState)] resizableImageWithCapInsets: [self capInsets]];
	
	[self.customButton setBackgroundImage: self.onStateImage forState: UIControlStateNormal];
	[self.customButton setBackgroundImage: self.offStateImage forState: UIControlStateHighlighted];
}

- (void)dealloc
{
    self.onStateImage = nil;
    self.offStateImage = nil;
    self.customButton = nil;
}


- (UIImage*)imageForSelector: (SEL)selector
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
	
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector: selector];
#pragma clang diagnostic pop
	
    UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

- (UIEdgeInsets)capInsets
{
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

- (CGSize)size
{
    return self.customButton.bounds.size;
}


- (void)drawOnState
{
    
}

- (void)drawOffState
{
    
}



@end
