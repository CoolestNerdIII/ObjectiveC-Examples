//
//  HeroListController.h
//  SuperDB
//
//  Created by Paul Wilson on 8/4/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroListController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITabBarDelegate, NSFetchedResultsControllerDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *heroTableView;
@property (strong, nonatomic) IBOutlet UITabBar *heroTabBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

- (IBAction)addHero:(id)sender;
@end
