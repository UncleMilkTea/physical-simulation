//
//  HYKsnapView.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKsnapView.h"

@implementation HYKsnapView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.animator removeAllBehaviors];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:self.boxView snapToPoint:[touches.anyObject locationInView:self]];
    
    snap.damping = 0;//越小越剧烈
    
    [self.animator addBehavior:snap];
}

@end
