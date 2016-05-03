//
//  ParentMenusViewController.m
//  20160503001-PresentAndChildViewController-ContactMenus
//
//  Created by Rainer on 16/5/3.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ParentMenusViewController.h"
#import "CategoriesModel.h"

@interface ParentMenusViewController ()

@property (nonatomic, strong) NSArray *menuArray;

@end

static NSString *tableViewCellIdentifier = @"categoriesTableViewCellIdentifier";

@implementation ParentMenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellIdentifier];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self tableView:self didSelectRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    CategoriesModel *categoriesModel = self.menuArray[indexPath.row];
    
    tableViewCell.imageView.image = [UIImage imageNamed:categoriesModel.icon];
    tableViewCell.imageView.highlightedImage = [UIImage imageNamed:categoriesModel.highlighted_icon];
    tableViewCell.textLabel.text = categoriesModel.name;
    tableViewCell.textLabel.highlightedTextColor = [UIColor colorWithRed:69 / 255.0 green:201 / 255.0 blue:191 / 255.0 alpha:1];
    
    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate) {
        CategoriesModel *categoriesModel = self.menuArray[indexPath.row];
        
        [self.delegate parentMenusViewController:self didSelectedCategories:categoriesModel];
    }
}

- (NSArray *)menuArray {
    if (nil == _menuArray) {
        NSArray *menuArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
        
        NSMutableArray *menuMutableArray = [NSMutableArray array];
        
        [menuArray enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger idx, BOOL *stop) {
            CategoriesModel *categoriesModel = [CategoriesModel categoriesWithDictionary:dictionary];
            
            [menuMutableArray addObject:categoriesModel];
        }];
        
        _menuArray = menuMutableArray;
    }
    
    return _menuArray;
}

@end
