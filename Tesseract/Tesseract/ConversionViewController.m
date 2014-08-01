//
//  ConversionViewController.m
//  Tesseract
//
//  Created by Paul Wilson on 3/17/14.
//  Copyright (c) 2014 Paul Wilson. All rights reserved.
//

#import "ConversionViewController.h"
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

#import "ImageProcessingImplementation.h"
#import "UIImage+operation.h"

#define RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ConversionViewController ()

@end

@implementation ConversionViewController
@synthesize outputText, imageView, inputImage;
@synthesize processedImage;
@synthesize imageProcessor;



- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // language are used for recognition. Ex: eng. Tesseract will search for a eng.traineddata file in the dataPath directory; eng+ita will search for a eng.traineddata and ita.traineddata.
    
    //Like in the Template Framework Project:
    // Assumed that .traineddata files are in your "tessdata" folder and the folder is in the root of the project.
    // Assumed, that you added a folder references "tessdata" into your xCode project tree, with the ‘Create folder references for any added folders’ options set up in the «Add files to project» dialog.
    // Assumed that any .traineddata files is in the tessdata folder, like in the Template Framework Project
    
    //Create your tesseract using the initWithLanguage method:
    // Tesseract* tesseract = [[Tesseract alloc] initWithLanguage:@"eng+ita"];
    
    // set up the delegate to recieve tesseract's callback
    // self should respond to TesseractDelegate and implement shouldCancelImageRecognitionForTesseract: method
    // to have an ability to recieve callback and interrupt Tesseract before it finishes
    
    [imageView setImage:inputImage];
        
    
    Tesseract* tesseract = [[Tesseract alloc] initWithLanguage:@"eng"];
    tesseract.delegate = self;
    
    
    self.processedImage=[imageProcessor processImage:[self inputImage]];

    
    //UIImage *processedImage = inputImage;
    
    //processedImage = [self gs_convert_image:processedImage];
    //processedImage = [self resizeImage:processedImage];
    //processedImage = [self toGrayscale:processedImage];
    
    //[tesseract setVariableValue:@"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\"," forKey:@"tessedit_char_whitelist"]; //limit search
    
    [tesseract setImage:inputImage]; //image to check
    [tesseract recognize];

    
    NSLog(@"%@", [tesseract recognizedText]);
    outputText.text = [tesseract recognizedText];
    
    tesseract = nil; //deallocate and free all memory
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldCancelImageRecognitionForTesseract:(Tesseract*)tesseract
{
    NSLog(@"progress: %d", tesseract.progress);
    return NO;  // return YES, if you need to interrupt tesseract before it finishes
}

#pragma -
#pragma Image Processing Tricks

// this does the trick to have tesseract accept the UIImage.
- (UIImage *) gs_convert_image: (UIImage *) src_img
{
    CGColorSpaceRef d_colorSpace = CGColorSpaceCreateDeviceRGB();
    /*
     * Note we specify 4 bytes per pixel here even though we ignore the
     * alpha value; you can't specify 3 bytes per-pixel.
     */
    size_t d_bytesPerRow = src_img.size.width * 4;
    unsigned char * imgData = (unsigned char*)malloc(src_img.size.height*d_bytesPerRow);
    CGContextRef context =  CGBitmapContextCreate(imgData, src_img.size.width,
                                                  src_img.size.height,
                                                  8, d_bytesPerRow,
                                                  d_colorSpace,
                                                  kCGImageAlphaNoneSkipFirst);
    
    UIGraphicsPushContext(context);
    // These next two lines 'flip' the drawing so it doesn't appear upside-down.
    CGContextTranslateCTM(context, 0.0, src_img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    // Use UIImage's drawInRect: instead of the CGContextDrawImage function, otherwise you'll have issues when the source image is in portrait orientation.
    [src_img drawInRect:CGRectMake(0.0, 0.0, src_img.size.width, src_img.size.height)];
    UIGraphicsPopContext();
    
    /*
     * At this point, we have the raw ARGB pixel data in the imgData buffer, so
     * we can perform whatever image processing here.
     */
    
    
    // After we've processed the raw data, turn it back into a UIImage instance.
    CGImageRef new_img = CGBitmapContextCreateImage(context);
    UIImage * convertedImage = [[UIImage alloc] initWithCGImage:
                                new_img];
    
    CGImageRelease(new_img);
    CGContextRelease(context);
    CGColorSpaceRelease(d_colorSpace);
    free(imgData);
    return convertedImage;
}

-(UIImage *)resizeImage:(UIImage *)image {
    
    CGImageRef imageRef = [image CGImage];
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
    CGColorSpaceRef colorSpaceInfo = CGColorSpaceCreateDeviceRGB();
    
    if (alphaInfo == kCGImageAlphaNone)
        alphaInfo = kCGImageAlphaNoneSkipLast;
    
    int width, height;
    
    width = 640;//[image size].width;
    height = 640;//[image size].height;
    
    CGContextRef bitmap;
    
    if (image.imageOrientation == UIImageOrientationUp | image.imageOrientation == UIImageOrientationDown) {
        bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, alphaInfo);
        
    } else {
        bitmap = CGBitmapContextCreate(NULL, height, width, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, alphaInfo);
        
    }
    
    if (image.imageOrientation == UIImageOrientationLeft) {
        NSLog(@"image orientation left");
        CGContextRotateCTM (bitmap, RADIANS(90));
        CGContextTranslateCTM (bitmap, 0, -height);
        
    } else if (image.imageOrientation == UIImageOrientationRight) {
        NSLog(@"image orientation right");
        CGContextRotateCTM (bitmap, RADIANS(-90));
        CGContextTranslateCTM (bitmap, -width, 0);
        
    } else if (image.imageOrientation == UIImageOrientationUp) {
        NSLog(@"image orientation up");
        
    } else if (image.imageOrientation == UIImageOrientationDown) {
        NSLog(@"image orientation down");
        CGContextTranslateCTM (bitmap, width,height);
        CGContextRotateCTM (bitmap, RADIANS(-180.));
        
    }
    
    CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage *result = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return result;

}

- (UIImage *) toGrayscale:(UIImage*)img
{
    const int RED = 1;
    const int GREEN = 2;
    const int BLUE = 3;
    
    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, img.size.width * img.scale, img.size.height * img.scale);
    
    int width = imageRect.size.width;
    int height = imageRect.size.height;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [img CGImage]);
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // convert to grayscale using recommended method:     http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[RED] + 0.59 * rgbaPixel[GREEN] + 0.11 * rgbaPixel[BLUE];
            
            // set the pixels to gray
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:image
                                                 scale:img.scale
                                           orientation:UIImageOrientationUp];
    
    // we're done with image now too
    CGImageRelease(image);
    
    return resultUIImage;
}





@end
