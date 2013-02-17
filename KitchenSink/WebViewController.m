//
//  WebViewController.m
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/16/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

UIWebView *web;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Local Web Server";
    }
    return self;
}

- (id) initWithURL:(NSURL *)url
{
    self = [super init];
    self.url = url;
    self.title = @"Local Web Server";
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [web setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [web setDelegate:self];
    web.scrollView.bounces = NO;
    web.scalesPageToFit = YES;
    
    if(self.url != nil)
    {
        [web loadRequest:[[NSURLRequest alloc] initWithURL:self.url]];
    }
    
    [self.view addSubview:web];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //Check for Bridge Calls
    NSString *url = request.URL.absoluteString;

    if([url rangeOfString:@"bridge://"].location != NSNotFound){
        NSLog(@"Invoking the bridge.");
        
        if([url rangeOfString:@"alert"].location != NSNotFound){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Called from Bridge" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        
        return NO;
    }
    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:TRUE];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:FALSE];
}



@end
