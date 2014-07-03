//
//  CollectionDetailViewController.m
//  CollectionViewExample
//
//  Created by Paul Wilson on 6/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "CollectionDetailViewController.h"

@interface CollectionDetailViewController ()

@end

@implementation CollectionDetailViewController
@synthesize detailImageTitle, detailImageView, detailImage, detailTitle;

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
	// Do any additional setup after loading the view.
    detailImageTitle.text = detailTitle;
    detailImageView.image = detailImage;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
