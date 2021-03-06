//
//  UIColorPicker.m
//  SuperDB
//
//  Created by Paul Wilson on 8/5/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "UIColorPicker.h"
#import "QuartzCore/CAGradientLayer.h"

#define kTopBackgroundColor [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0]
#define kBottomBackgroundColor [UIColor colorWithRed:0.79 green:0.79 blue:0.79 alpha:1.0]

@interface UIColorPicker ()
@property (strong, nonatomic) UISlider *redSlider;
@property (strong, nonatomic) UISlider *greenSlider;
@property (strong, nonatomic) UISlider *blueSlider;
@property (strong, nonatomic) UISlider *alphaSlider;
- (IBAction)sliderChanged:(id)sender;
- (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text;
@end

@implementation UIColorPicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 40.0, 60, 24) text:@"Red"]];
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 80.0, 60, 24) text:@"Green"]];
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 120.0, 60, 24) text:@"Blue"]];
        [self addSubview:[self labelWithFrame:CGRectMake(20.0, 160.0, 60, 24) text:@"Alpha"]];
        
        _redSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 40.0, 190, 24)];
        _greenSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 80.0, 190, 24)];
        _blueSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 120.0, 190, 24)];
        _alphaSlider = [[UISlider alloc] initWithFrame:CGRectMake(100.0, 160.0, 190, 24)];
        
        [_redSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [_greenSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [_blueSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [_alphaSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:_redSlider];
        [self addSubview:_greenSlider];
        [self addSubview:_blueSlider];
        [self addSubview:_alphaSlider];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(__bridge id)[kTopBackgroundColor CGColor],
                       (__bridge id)[kBottomBackgroundColor CGColor], nil];
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    [_redSlider setValue:components[0]];
    [_greenSlider setValue:components[1]];
    [_blueSlider setValue:components[2]];
    [_alphaSlider setValue:components[3]];
}

#pragma mark - (Private) Instance Methods

- (IBAction)sliderChanged:(id)sender
{
    _color = [UIColor colorWithRed:_redSlider.value
                             green:_greenSlider.value
                              blue:_blueSlider.value
                             alpha:_alphaSlider.value];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.userInteractionEnabled = NO;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = [UIColor darkTextColor];
    label.text = text;
    return label;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
}

@end
