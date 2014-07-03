//
//  SBButtonCustomizer.h
//  SimpleIOSButton
//
//  Created by Peter Krajčík on 4.12.2012.
//  Copyright (c) 2012 PixelCut s.r.o. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBButtonCustomizer : NSObject
@property(retain) IBOutlet UIButton* customButton;

// These 3 should be overrided
- (CGSize)size;
- (void)drawOnState;
- (void)drawOffState;

@end
