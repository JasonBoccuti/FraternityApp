//
//  EventsCell.m
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/29/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import "EventsCell.h"

@implementation EventsCell

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
