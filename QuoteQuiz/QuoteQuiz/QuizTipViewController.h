//
//  QuizTipViewController.h
//  QuoteQuiz
//
//  Created by Linda Burke on 3/18/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QuizTipViewControllerDelegate;
@interface QuizTipViewController : UIViewController

@property (nonatomic, assign) id <QuizTipViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextView * tipView;
@property (nonatomic, copy) NSString * tipText;

- (IBAction)doneAction:(id)sender;

@end

@protocol QuizTipViewControllerDelegate
- (void)quizTipDidFinish:(QuizTipViewController *)controller;
@end


