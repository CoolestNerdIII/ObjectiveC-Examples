//
//  ViewController.h
//  Tesseract
//
//  Created by Paul Wilson on 3/17/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property BOOL newMedia;


- (IBAction)runDemo:(id)sender;
- (IBAction)openCamera:(id)sender;
- (IBAction)openLibrary:(id)sender;

@end
