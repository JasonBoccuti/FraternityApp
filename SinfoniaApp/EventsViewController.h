//
//  EventsViewController.h
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/29/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "EventsCell.h"

@interface EventsViewController : UIViewController <UITableViewDelegate> {
    
    NSArray *eventsArray;
}

@property (weak, nonatomic) IBOutlet UITableView *eventsTable;


@end
