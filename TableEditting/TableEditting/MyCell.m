//
//  MyCell.m
//  TableEditting
//
//  Created by Paul Wilson on 7/26/13.
//  Copyright (c) 2013 TnT Development. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //self.leftSide.autoresizingMask = YES;
        //self.leftSide.autoresizesSubviews = YES;
        
        //[self.contentView addSubview:self.leftSide];
        //[self.contentView addSubview:self.rightSide];
        [self.contentView addSubview:self.textLabel];
        [self.contentView addSubview:self.textfield];
        self.autoresizesSubviews  = YES;
        self.autoresizingMask = YES;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) didTransitionToState:(UITableViewCellStateMask)state {
    [super didTransitionToState:state];
    if (state == UITableViewCellStateEditingMask) {
        self.textfield.enabled = YES;
        self.textfield.borderStyle = UITextBorderStyleBezel;
    }
    if (state == UITableViewCellStateDefaultMask) {
        self.textfield.enabled = NO;
        self.textfield.borderStyle = UITextBorderStyleNone;
    }
    self.textfield.autoresizesSubviews = YES;
    self.textfield.adjustsFontSizeToFitWidth = YES;
    
}

-(void)awakeFromNib{
    [super awakeFromNib];
    for(NSLayoutConstraint *cellConstraint in self.constraints){
        [self removeConstraint:cellConstraint];
        id firstItem = cellConstraint.firstItem == self ? self.contentView : cellConstraint.firstItem;
        id seccondItem = cellConstraint.secondItem == self ? self.contentView : cellConstraint.secondItem;
        NSLayoutConstraint* contentViewConstraint =
        [NSLayoutConstraint constraintWithItem:firstItem
                                     attribute:cellConstraint.firstAttribute
                                     relatedBy:cellConstraint.relation
                                        toItem:seccondItem
                                     attribute:cellConstraint.secondAttribute
                                    multiplier:cellConstraint.multiplier
                                      constant:cellConstraint.constant];
        [self.contentView addConstraint:contentViewConstraint];
    }
}


@end
