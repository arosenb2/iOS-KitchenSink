//
//  JSONExample.m
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/17/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import "JSONExample.h"

@interface JSONExample ()

@end

@implementation JSONExample

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 44);
    [btn setTitle:@"Get Weather JSON" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonClicked
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:TRUE];
    dispatch_queue_t queue = dispatch_queue_create("com.cgifederal.KitchenSink.JSONExample", NULL);
    dispatch_async(queue, ^{
        NSString *conditions = [self getJSON];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current Conditions for Abingdon" message:conditions delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
            
            [alert show];
        });
    });
}

-(NSString *)getJSON
{
    NSError *error = nil;
    
    //[NSUrlRequest requestWithURL:[NSURL URLWithString:@"http://api.wunderground.com/api/9eef04261b85a08e/conditions/q/VA/Abingdon.json"]];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.wunderground.com/api/9eef04261b85a08e/conditions/q/VA/Abingdon.json"]];
    
    if (jsonData) {
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        if (error) {
            NSLog(@"error is %@", [error localizedDescription]);
            
            // Handle Error and return
            return @"";
        }
        
        NSDictionary *currentObservation = [jsonObjects valueForKey:@"current_observation"];
        
        return [[NSString alloc] initWithFormat:@"Feels like %@˚F",[currentObservation valueForKey:@"feelslike_f"]];
        
    } else {
        // Handle Error
    }
    
    return @"";
}

@end
