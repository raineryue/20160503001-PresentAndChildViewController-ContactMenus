//
//  ChildMenusViewController.m
//  20160503001-PresentAndChildViewController-ContactMenus
//
//  Created by Rainer on 16/5/3.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ChildMenusViewController.h"
#import "CategoriesModel.h"

@interface ChildMenusViewController ()

@property (nonatomic, strong) NSArray *categoriesArray;

@end

@implementation ChildMenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categoriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableViewCellIdentifier = @"subCategoriesTableViewCellIdentifier";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
    if (nil == tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tableViewCellIdentifier];
    }
    
    tableViewCell.textLabel.text = self.categoriesArray[indexPath.row];
    tableViewCell.textLabel.highlightedTextColor = [UIColor colorWithRed:69 / 255.0 green:201 / 255.0 blue:191 / 255.0 alpha:1];

    return tableViewCell;
}

- (void)parentMenusViewController:(ParentMenusViewController *)parentMenusViewController didSelectedCategories:(CategoriesModel *)categories {
    self.categoriesArray = categories.subcategories;
    
    [self.tableView reloadData];
}



@end
