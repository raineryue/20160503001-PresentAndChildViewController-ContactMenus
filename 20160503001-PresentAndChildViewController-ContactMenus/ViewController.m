//
//  ViewController.m
//  20160503001-PresentAndChildViewController-ContactMenus
//
//  Created by Rainer on 16/5/3.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "ParentMenusViewController.h"
#import "ChildMenusViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ParentMenusViewController *parentMenusViewController = [[ParentMenusViewController alloc] init];
    ChildMenusViewController *childMenusViewController = [[ChildMenusViewController alloc] init];
    
    parentMenusViewController.delegate = childMenusViewController;
    
    parentMenusViewController.view.frame = CGRectMake(0, 20, self.view.bounds.size.width * 0.5, self.view.bounds.size.height);
    childMenusViewController.view.frame = CGRectMake(self.view.bounds.size.width * 0.5, 20, self.view.bounds.size.width * 0.5, self.view.bounds.size.height);
    
//    parentMenusViewController.view.backgroundColor = [UIColor redColor];
//    childMenusViewController.view.backgroundColor = [UIColor blueColor];
    
    [self addChildViewController:parentMenusViewController];
    [self addChildViewController:childMenusViewController];
    
    [self.view addSubview:parentMenusViewController.view];
    [self.view addSubview:childMenusViewController.view];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
