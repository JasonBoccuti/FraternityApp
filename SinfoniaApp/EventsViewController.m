//
//  EventsViewController.m
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/29/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController () {
    NSMutableArray *_objects;
}

@end

@implementation EventsViewController

@synthesize eventsTable;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(retrieveFromParse)];
}

- (void) retrieveFromParse {
    
    PFQuery *retrieveEvents = [PFQuery queryWithClassName:@"eventTableViewData"];
    
    [retrieveEvents findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            eventsArray = [[NSArray alloc] initWithArray:objects];
        }
        [eventsTable reloadData];
    }];
}


//get number of sections in tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//get number of rows by counting number of folders
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return eventsArray.count;
}

//setup cells in tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //setup cell
    static NSString *CellIdentifier = @"eventCell";
    EventsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFObject *tempObject = [eventsArray objectAtIndex:indexPath.row];
    
    cell.cellTitle.text = [tempObject objectForKey:@"cellTitle"];
    
    return cell;
}


//user selects folder to add tag to
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell tapped");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
