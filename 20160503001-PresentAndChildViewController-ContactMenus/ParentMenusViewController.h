//
//  ParentMenusViewController.h
//  20160503001-PresentAndChildViewController-ContactMenus
//
//  Created by Rainer on 16/5/3.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoriesModel;
@class ParentMenusViewController;

@protocol ParentMenusViewControllerDelegate <NSObject>

@optional
- (void)parentMenusViewController:(ParentMenusViewController *)parentMenusViewController didSelectedCategories:(CategoriesModel *)categories;

@end

@interface ParentMenusViewController : UITableViewController

@property (nonatomic, weak) id<ParentMenusViewControllerDelegate> delegate;

@end
