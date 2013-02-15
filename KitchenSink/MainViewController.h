//
//  MainViewController.h
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/12/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
}

@property (nonatomic,strong) UITableView *tbl;
@property (nonatomic,retain) NSArray *items;

@end
