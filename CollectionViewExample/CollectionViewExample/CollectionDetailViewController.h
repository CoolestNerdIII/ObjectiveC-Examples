//
//  CollectionDetailViewController.h
//  CollectionViewExample
//
//  Created by Paul Wilson on 6/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *detailImageView;
@property (strong, nonatomic) IBOutlet UILabel *detailImageTitle;
@property (strong, nonatomic)UIImage *detailImage;
@property (strong, nonatomic)NSString *detailTitle;

@end
