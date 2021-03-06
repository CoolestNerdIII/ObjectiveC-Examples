//
//  SuperDBColorCell.m
//  SuperDB
//
//  Created by Paul Wilson on 8/5/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "SuperDBColorCell.h"
#import "UIColorPicker.h"

@interface SuperDBColorCell ()
@property (strong, nonatomic) UIColorPicker *colorPicker;
- (void)colorPickerChanged:(id)sender;
- (NSAttributedString *)attributedColorString;
@end

@implementation SuperDBColorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.colorPicker = [[UIColorPicker alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
        [self.colorPicker addTarget:self action:@selector(colorPickerChanged:) forControlEvents:UIControlEventValueChanged];
        self.textField.inputView = self.colorPicker;
        self.textField.clearButtonMode = UITextFieldViewModeNever;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma mark - SuperDBEditCell Overrides

- (id)value
{
    return self.colorPicker.color;
}
- (void)setValue:(id)value
{
    if (value != nil && [value isKindOfClass:[UIColor class]]) {
        [super setValue:value];
        self.colorPicker.color = value;
    }
    else {
        self.colorPicker.color = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    }
    self.textField.attributedText = self.attributedColorString;
}

#pragma mark - (Private) Instance Methods

- (void)colorPickerChanged:(id)sender
{
    self.textField.attributedText = self.attributedColorString;
}

- (NSAttributedString *)attributedColorString
{
    NSString *block = [NSString
                       stringWithUTF8String:"\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588"];
    UIColor *color = self.colorPicker.color;
    NSDictionary *attrs = @{NSForegroundColorAttributeName:color,
                            NSFontAttributeName:[UIFont boldSystemFontOfSize:[UIFont systemFontSize]]};
    NSAttributedString *attributedString =
    [[NSAttributedString alloc] initWithString:block attributes:attrs];
    return attributedString;
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
