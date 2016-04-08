//
//  HYKTableViewController.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKTableViewController.h"
#import "DemoViewController.h"

@interface HYKTableViewController ()

@property (strong,nonatomic)NSArray *behaviorArray;

@end

@implementation HYKTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"多物理仿真行为";
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    
}


#pragma mark 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.behaviorArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.behaviorArray[indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;


}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DemoViewController *demo = [[DemoViewController alloc]init];
    
    [self.navigationController pushViewController:demo animated:YES];
    
    demo.function = indexPath.row;
    
    demo.navigationItem.title = self.behaviorArray[indexPath.row];
}

/**
 *  懒加载数组
 */


- (NSArray *)behaviorArray {
    
    _behaviorArray = [[NSArray alloc]init];
    _behaviorArray = @[@"吸附行为",@"推动行为",@"刚性附着行为",@"弹性行为",@"碰撞检测行为"];

    return _behaviorArray;
}
@end
