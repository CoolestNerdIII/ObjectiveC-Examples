//
//  SBAppDelegate.h
//  SimpleIOSButton
//
//  Created by Peter Krajčík on 4.12.2012.
//  Copyright (c) 2012 PixelCut s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBViewController;

@interface SBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SBViewController *viewController;

@end
