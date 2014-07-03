//
//  ViewController.m
//  CoolPattern
//
//  Created by Paul Wilson on 6/12/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView * scrollView = (UIScrollView *) self.view;
    [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 1.5)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
