//
//  SuperDBPickerCell.h
//  SuperDB
//
//  Created by Paul Wilson on 8/5/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "SuperDBEditCell.h"

@interface SuperDBPickerCell : SuperDBEditCell< UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) NSArray *values;

@end
