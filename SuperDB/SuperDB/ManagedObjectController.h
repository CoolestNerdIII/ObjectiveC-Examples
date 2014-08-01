//
//  HeroDetailController.h
//  SuperDB
//
//  Created by Paul Wilson on 8/5/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ManagedObjectConfiguration;

@interface ManagedObjectController : UITableViewController

@property (strong, nonatomic) ManagedObjectConfiguration *config;
@property (strong, nonatomic) NSManagedObject *managedObject;

- (NSManagedObject *)addRelationshipObjectForSection:(NSInteger)section;
- (void)removeRelationshipObjectInIndexPath:(NSIndexPath *)indexPath;

@end
