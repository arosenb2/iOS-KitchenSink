//
//  ChildBrowser.m
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/13/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import "ChildBrowser.h"

@interface ChildBrowser ()

@end

@implementation ChildBrowser

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithURL:(NSURL *)defaultURL
{
    self.url = defaultURL;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44)];
    
    web.delegate = self;
    
    [web setAutoresizesSubviews:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    web.scrollView.bounces = NO;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    
    [toolbar setBarStyle:UIBarStyleBlack];
    NSArray *toolbarItems = [[NSArray alloc] initWithObjects:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeView)], nil];
    [toolbar setItems:toolbarItems];
    
    [web loadRequest:[[NSURLRequest alloc] initWithURL:self.url]];
    
    [self.view addSubview:web];
    [self.view addSubview:toolbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)closeView
{
    [self dismissViewControllerAnimated:true completion:nil];
}


#pragma UIWebViewDelegate Methods
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if([request.URL.absoluteString hasPrefix:@"http"])
    {
        return YES;
    }
    else if([[UIApplication sharedApplication] canOpenURL:request.URL])
    {
        [[UIApplication sharedApplication] openURL:request.URL];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
