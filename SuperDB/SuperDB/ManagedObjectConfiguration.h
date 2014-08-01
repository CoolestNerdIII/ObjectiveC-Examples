//
//  HeroDetailConfiguration.h
//  SuperDB
//
//  Created by Paul Wilson on 8/5/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagedObjectConfiguration : NSObject

- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
- (NSString *)headerInSection:(NSInteger)section;
- (NSDictionary *)rowForIndexPath:(NSIndexPath *)indexPath;

- (NSString *)cellClassnameForIndexPath:(NSIndexPath *)indexPath;
- (NSArray *)valuesForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)attributeKeyForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)labelForIndexPath:(NSIndexPath *)indexPath;

- (BOOL)isDynamicSection:(NSInteger)section;
- (NSString *)dynamicAttributeKeyForSection:(NSInteger)section;

- (id)initWithResource:(NSString *)resource;
@end
