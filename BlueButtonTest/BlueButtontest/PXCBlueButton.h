//
//  PXCBlueButton.h
//  BlueButtontest
//
//  Created by Peter Krajčík on 18.3.2012.
//  Copyright (c) 2012 PixelCut s.r.o. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PXCBlueButton : NSButton
{
    NSColor*    baseColor;
    CGFloat     flareAlpha;
    NSTimer*    flareTimer;
}

@property (copy) NSColor* baseColor;
@property (nonatomic) CGFloat  flareAlpha;

@end
