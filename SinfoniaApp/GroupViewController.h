//
//  GroupsViewController.h
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/28/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "GroupCell.h"

@interface GroupViewController : UIViewController <UITableViewDelegate> {
    
    NSArray *groupsArray;
}

@property (weak, nonatomic) IBOutlet UITableView *groupsTable;

@end

