//
//  IBViewController.m
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/25/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import "IBViewController.h"

@interface IBViewController ()

@end

@implementation IBViewController

@synthesize tabBar,pagesBtn,activityBtn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Interface Builder";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [tabBar setSelectedItem: [tabBar.items objectAtIndex:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITabBarDelegate Methods
-(void) tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"ButtonTitle: %@",item.title);
}

@end
