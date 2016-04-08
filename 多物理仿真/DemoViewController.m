//
//  DemoViewController.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "DemoViewController.h"
#import "HYKsnapView.h"
#import "HYKbasicView.h"
#import "HYKpushView.h"
#import "HYKSpringView.h"
#import "HYKCollisionView.h"
#import "HYKAttachmentView.h"




@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    HYKbasicView *basicView = nil;
    switch (self.function) {
        case kDemoFunctionSnap:
            basicView = [[HYKsnapView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFunctionPush:
            basicView = [[HYKpushView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFunctionAttach:
            basicView = [[HYKAttachmentView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFunctionSpring:
            basicView = [[HYKSpringView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFunctionCollection:
            basicView = [[HYKCollisionView alloc]initWithFrame:self.view.bounds];
            break;
        default:
            break;
    }
    [self.view addSubview:basicView];
}


@end
