//
//  MySupplementaryView.m
//  CollectionViewExample
//
//  Created by Paul Wilson on 6/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MySupplementaryView.h"

@implementation MySupplementaryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MySupplementaryView *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyHeader"
                                                           forIndexPath:indexPath];
        
        header.headerLabel.text = @"My Title";
    }
    return header;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
