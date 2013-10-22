//
//  MasterViewController.m
//  CellSelection
//
//  Created by D.T on 10/10/12.
//  Copyright (c) 2013 D.T. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController ()
{
  NSMutableArray *mObjects_;
  NSDictionary   *mColorsDictonary_;
}
@end

@implementation MasterViewController

#pragma mark - Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self)
  {
    self.title = NSLocalizedString(@"Rainbow Colors", @"Rainbow Colors");
    mObjects_ = [[NSMutableArray alloc] initWithObjects:@"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Indigo", @"Violet", nil];
    mColorsDictonary_ = [[NSDictionary alloc] initWithObjectsAndKeys:
                         [UIColor redColor], @"red",
                         [UIColor orangeColor], @"orange",
                         [UIColor yellowColor], @"yellow",
                         [UIColor greenColor], @"green",
                         [UIColor blueColor], @"blue",
                         [UIColor colorWithRed:(75./255.0) green:(0./255.0) blue:(130./255.0) alpha:1.], @"indigo",
                         [UIColor colorWithRed:(143./255.0) green:(0./255.0) blue:(255./255.0) alpha:1.], @"violet",
                         nil];
  }
  return self;
}

#pragma mark - UIViewController overridden

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return mObjects_.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
  
  NSString *text = mObjects_[indexPath.row];
  
  // Update cell text
  cell.textLabel.text = text;
  
  // Set background color
  UIView *background = [[UIView alloc] initWithFrame:cell.frame];
  background.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  background.backgroundColor  = [UIColor whiteColor];
  cell.backgroundView = background;
  
  // Set selected background color
  UIView *selectionColor = [[UIView alloc] initWithFrame:cell.frame];
  selectionColor.backgroundColor = [mColorsDictonary_ objectForKey:[text lowercaseString]];
  selectionColor.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  cell.selectedBackgroundView = selectionColor;
  
  return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Return NO if you do not want the specified item to be editable.
  return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (!self.detailViewController)
  {
    self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
  }
  
  NSString *selectedItem = mObjects_[indexPath.row];
  self.detailViewController.detailItem = selectedItem;
  self.detailViewController.selectedColor = [mColorsDictonary_ objectForKey:[selectedItem lowercaseString]];
  [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
