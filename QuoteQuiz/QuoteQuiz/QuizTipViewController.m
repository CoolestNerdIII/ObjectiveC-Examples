//
//  QuizTipViewController.m
//  QuoteQuiz
//
//  Created by Linda Burke on 3/18/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import "QuizTipViewController.h"

@interface QuizTipViewController ()

@end

@implementation QuizTipViewController

- (IBAction)doneAction:(id)sender
{
    [self.delegate quizTipDidFinish:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tipView.text = self.tipText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
