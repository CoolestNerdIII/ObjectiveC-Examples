//
//  CalculatorAppDelegate.h
//  Calculator
//
//  Created by Krzysiek on 09-04-25.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calc.h"

@class Calc;
@interface CalculatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

