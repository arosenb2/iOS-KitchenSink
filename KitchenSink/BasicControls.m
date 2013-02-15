//
//  BasicControls.m
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/14/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import "BasicControls.h"

@interface BasicControls ()

@end

@implementation BasicControls

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"Basic Controls";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton *sampleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sampleButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [sampleButton setTitle:@"UIButton" forState:UIControlStateNormal];
    sampleButton.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 44.0);
    
    UILabel *simpleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, sampleButton.frame.origin.y+sampleButton.frame.size.height+10, self.view.frame.size.width-20, 30)];
    simpleLabel.text = @"Simple UILabel Example";
    simpleLabel.backgroundColor = [UIColor blueColor];
    simpleLabel.textColor = [[UIColor alloc] initWithRed:220 green:220 blue:220 alpha:255];
    
    [self.view addSubview:sampleButton];
    [self.view addSubview:simpleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonClicked
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIButton Pressed" message:@"You clicked the UIButton." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
}

@end
