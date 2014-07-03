//
//  PXCAppDelegate.m
//  BlueButtontest
//
//  Created by Peter Krajčík on 18.3.2012.
//  Copyright (c) 2012 PixelCut s.r.o. All rights reserved.
//

#import "PXCAppDelegate.h"
#import "PXCBlueButton.h"

@implementation PXCAppDelegate

@synthesize window = _window;
@synthesize colorWell, button;

- (void)dealloc
{
    self.colorWell = nil;
    self.button = nil;
    [super dealloc];
}

- (void)awakeFromNib
{
    [self.colorWell setColor: [NSColor colorWithCalibratedRed: 0.10 green: 0.2 blue: 0.90 alpha: 1]];
    [self updateColor: self];
    
    [NSTimer scheduledTimerWithTimeInterval: 1.0/30.0 target: self selector: @selector(tick) userInfo: nil repeats: YES];
}

- (void)tick
{
    self.button.flareAlpha = (sin([NSDate timeIntervalSinceReferenceDate]*4)+1) / 2;
}

- (void)updateColor: (id)sender
{
    self.button.baseColor = self.colorWell.color;
    [self.button setNeedsDisplay: YES];
}

@end
