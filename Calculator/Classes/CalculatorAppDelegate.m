//
//  CalculatorAppDelegate.m
//  Calculator
//
//  Created by Krzysiek on 09-04-25.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "CalculatorAppDelegate.h"

@implementation CalculatorAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	Calc *viewController = [[Calc alloc] initWithNibName:@"Calculator" bundle:[NSBundle mainBundle]];
	[window addSubview:[viewController view]];
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
