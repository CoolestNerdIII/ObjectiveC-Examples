//
//  ConversionViewController.h
//  Tesseract
//
//  Created by Paul Wilson on 3/17/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "ViewController.h"
#import <TesseractOCR/TesseractOCR.h>

#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

#import "ImageProcessingProtocol.h"




@interface ConversionViewController : ViewController  <TesseractDelegate>

@property (strong, nonatomic) UIImage *inputImage;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *outputText;

@property (strong,nonatomic) UIImage *processedImage;
@property (strong, nonatomic) id <ImageProcessingProtocol> imageProcessor;



@end
