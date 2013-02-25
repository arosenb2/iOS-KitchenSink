//
//  ChildBrowser.h
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/13/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildBrowser : UIViewController <UIWebViewDelegate>

- (id)initWithURL:(NSURL *)defaultURL;

@property (nonatomic) NSURL *url;

@end
