//
//  MyCollectionViewController.h
//  CollectionViewExample
//
//  Created by Paul Wilson on 6/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewCell.h"
#import "MySupplementaryView.h"

@interface MyCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property(strong,nonatomic) NSArray *myImages;
@property(strong,nonatomic) NSArray *myTitles;

@end
