//
//  DetailViewController.m
//  RainbowColors
//
//  Created by D.T on 10/10/12.
//  Copyright (c) 2013 D.T. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

- (void)configureView;

@end

@implementation DetailViewController
{
@private
  __strong UIColor *mSelectedColor_;
}

@synthesize selectedColor = mSelectedColor_;

#pragma mark - Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  return self;
}

#pragma mark - Properties

- (void)setDetailItem:(id)newDetailItem
{
  if (_detailItem != newDetailItem)
  {
    _detailItem = newDetailItem;
    // Update the view.
    [self configureView];
  }
}

#pragma mark - Private methods

- (void)configureView
{
  self.detailDescriptionLabel.text = self.detailItem;
}

#pragma mark - UIViewController overridden

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
  self.title = self.detailItem;
  
  self.view.backgroundColor = mSelectedColor_;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
