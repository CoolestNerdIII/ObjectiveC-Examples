//
//  PXCBackgroundView.m
//  glossyButtonTest
//
//  Created by Miso on 3/18/12.
//  Copyright (c) 2012 PixelCut. All rights reserved.
//

#import "PXCBackgroundView.h"

@implementation PXCBackgroundView

- (void)drawRect: (NSRect)dirtyRect
{
    [[NSColor colorWithCalibratedRed: 0.35 green: 0.35 blue: 0.35 alpha: 1] setFill];
    NSRectFill([self bounds]);
}

@end
