//
//  WebViewController.h
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/16/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

-(id) initWithURL:(NSURL *)url;

@property(nonatomic) NSURL *url;

@end
