//
//  SuperDBEditCell.h
//  SuperDB
//
//  Created by Paul Wilson on 8/5/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperDBCell.h"

@interface SuperDBEditCell : SuperDBCell <UITextFieldDelegate, UIAlertViewDelegate>

- (IBAction)validate;
@end
