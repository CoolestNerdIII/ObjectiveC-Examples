//
//  ViewController.h
//  CoolButton
//
//  Created by Paul Wilson on 6/12/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoolButton;

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet CoolButton * coolButton;

- (IBAction)hueValueChanged:(id)sender;
- (IBAction)saturationValueChanged:(id)sender;
- (IBAction)brightnessValueChanged:(id)sender;

@end