//
//  PXCAppDelegate.h
//  BlueButtontest
//
//  Created by Peter Krajčík on 18.3.2012.
//  Copyright (c) 2012 PixelCut s.r.o. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PXCBlueButton;

@interface PXCAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow* window;

@property (retain) IBOutlet PXCBlueButton* button;
@property (retain) IBOutlet NSColorWell* colorWell;

- (IBAction)updateColor: (id)sender;

@end
