//
//  TableViewController.h
//  TableEditting
//
//  Created by Paul Wilson on 7/25/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UIAlertViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray * info;
@property (strong, nonatomic) NSMutableArray * sectionNames;

@property (strong, nonatomic) NSMutableIndexSet * expandedSections;

@property BOOL sectionOneCollapsed;
@property BOOL sectionTwoCollapsed;

@end
