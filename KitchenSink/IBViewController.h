//
//  IBViewController.h
//  KitchenSink
//
//  Created by Aaron Rosenbaum on 2/25/13.
//  Copyright (c) 2013 Aaron Rosenbaum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBViewController : UIViewController <UITabBarDelegate>
{
    IBOutlet UITabBar *tabBar;
    
    IBOutlet UITabBarItem *pagesBtn,*activityBtn;
}


@property (strong, nonatomic) IBOutlet UITabBar *tabBar;

@property (strong, nonatomic) IBOutlet UITabBarItem *pagesBtn;

@property (strong, nonatomic) IBOutlet UITabBarItem *activityBtn;

@end
