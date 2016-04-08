//
//  DemoViewController.h
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,kDemoFunction) {

    kDemoFunctionSnap,
    kDemoFunctionPush,
    kDemoFunctionAttach,
    kDemoFunctionSpring,
    kDemoFunctionCollection
};


@interface DemoViewController : UIViewController

@property(assign,nonatomic) kDemoFunction function;
@end
