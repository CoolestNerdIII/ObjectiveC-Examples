//
//  QuoteQuizViewController.h
//  QuoteQuiz
//
//  Created by Linda Burke on 3/18/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizTipViewController.h"

@class Quiz;
@interface QuoteQuizViewController : UIViewController <QuizTipViewControllerDelegate>

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) Quiz * quiz;

- (IBAction)ans1Action:(id)sender;
- (IBAction)ans2Action:(id)sender;
- (IBAction)ans3Action:(id)sender;
- (IBAction)startAgain:(id)sender;

@end
