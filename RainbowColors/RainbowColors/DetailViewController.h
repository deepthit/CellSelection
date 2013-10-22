//
//  DetailViewController.h
//  RainbowColors
//
//  Created by D.T on 10/10/12.
//  Copyright (c) 2013 D.T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) UIColor *selectedColor;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
