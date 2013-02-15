//
//  MainViewController.m
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/12/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import "MainViewController.h"
#import "ChildBrowser.h"
#import "BasicControls.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"Kitchen Sink";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.tbl = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];

    self.tbl.delegate = self;
    self.tbl.dataSource = self;
    
    self.items = [[NSArray alloc] initWithObjects:
                  @"AlertView Example",
                  @"ChildBrowser Example",
                  @"Basic Controls Example",
                  @"Local Web Server Example",
                  @"MapKit Example",
                  nil];
    
    [self.view setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    [self.view addSubview:self.tbl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// UITableView DataSource and Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    
    switch(indexPath.row){
        case 0: //AlertView
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"This is a sample of the UIAlertView." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
            break;
        case 1: //ChildBrowser
        {
            ChildBrowser *cb = [[ChildBrowser alloc] initWithURL:[[NSURL alloc] initWithString:@"http://m.cgi.com"]];
            [self presentViewController:cb animated:TRUE completion:nil];
        }
            break;
        case 2: //Basic Controls
        {
            BasicControls *bc = [[BasicControls alloc] init];
            [[self navigationController] pushViewController:bc animated:TRUE];
        }
            break;
        case 3: //Local Web Server
        {
            
        }
            break;
            
        case 4: //MapKit
        {
            
        }
        default: //Should never use this
        {
        
        }
            break;
    }
}

@end
