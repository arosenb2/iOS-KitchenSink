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
    
    UILabel *complexLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, simpleLabel.frame.origin.y+simpleLabel.frame.size.height+10, self.view.frame.size.width-20, 30)];
    complexLabel.text = @"Lorem ipsum bacon meat steak lots of good food here to eat. Never bake a steak unless you are Alton Brown and are an expert chef. This is just long to demonstrate multiple lines.";
    complexLabel.shadowColor = [UIColor darkTextColor];
    complexLabel.shadowOffset = CGSizeMake(0, 1);
    
    complexLabel.layer.borderColor = [UIColor darkGrayColor].CGColor;
    complexLabel.layer.borderWidth = 1.0;
    complexLabel.layer.cornerRadius = 8.0;
    
    [complexLabel setNumberOfLines:0];
    [complexLabel sizeToFit];
    
    [self.view addSubview:sampleButton];
    [self.view addSubview:simpleLabel];
    [self.view addSubview:complexLabel];
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
