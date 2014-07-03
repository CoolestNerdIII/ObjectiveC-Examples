//
//  MyCollectionViewController.m
//  CollectionViewExample
//
//  Created by Paul Wilson on 6/10/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "CollectionDetailViewController.h"

@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController
@synthesize myImages, myTitles;

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
    //myImages = [@[@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg"]];
    myImages = [[NSArray alloc] initWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", nil];
    myTitles = [[NSArray alloc] initWithObjects:@"angry birds cake", @"creme brelee.jpg", @"egg benedict.jpg", @"full breakfast.jpg", @"green tea.jpg", @"ham and cheese panini.jpg", nil];
    
}



#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return myImages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    UIImage *image;
    int row = [indexPath row];
    
    image = [UIImage imageNamed:myImages[row]];
    
    myCell.imageView.image = image;
    
    return myCell;
}


/*
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image;
    int row = [indexPath row];
    
    image = [UIImage imageNamed:myImages[row]];
    
    return image.size;
}
*/

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewFlowLayout *myLayout =
    [[UICollectionViewFlowLayout alloc]init];
    
    myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:myLayout animated:YES];
}

#pragma mark - Prepare for Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UICollectionViewCell *cell = (UICollectionViewCell *)sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    CollectionDetailViewController *collectionDetailViewController = (CollectionDetailViewController *)segue.destinationViewController;
    collectionDetailViewController.detailImage = [UIImage imageNamed:[myImages objectAtIndex:indexPath.row]];
    collectionDetailViewController.detailTitle = [myTitles objectAtIndex:indexPath.row];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
