//
//  GroupCell.m
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/28/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import "GroupCell.h"

@implementation GroupCell

@synthesize cellTitle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
