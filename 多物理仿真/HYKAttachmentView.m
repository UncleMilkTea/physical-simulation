//
//  HYKAttachmentView.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKAttachmentView.h"

@interface HYKAttachmentView ()
{

    CGPoint _offSet;
    
    UIImageView *_boxImg;

}

@end

@implementation HYKAttachmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //附着行为附着点
        CGPoint anchor = CGPointMake(300, 300);
        
        //设置附着点图片位置
        self.imagePoint.center = anchor;
        
        //创建附着行为
        _attach = [[UIAttachmentBehavior alloc]initWithItem:self.boxView offsetFromCenter:UIOffsetMake(20, 20) attachedToAnchor:anchor];
        
        [self.animator addBehavior:_attach];
        
        /**************************************************************
         *  设置boxView上的图片点,他的中心位置是和图片的附着点重合的,而且需要确定的附着点所在父类View的实际位置
         **************************************************************/
        //计算偏移
       _offSet = CGPointMake(self.boxView.bounds.size.width*.5 + 20, self.boxView.bounds.size.width*.5 + 20);
        
        //设置图片上的点
        _boxImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        _boxImg.center = _offSet;
        
        [self.boxView addSubview:_boxImg];
        
        //开始重绘方法没有初始值需要赋值
        
        // 设置终点
        [self Roate];
        //重绘终点
            [[CADisplayLink displayLinkWithTarget:self selector:@selector(Roate)] addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
        //添加手势识别器
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
       
    }
    return self;
}


//设置实时附着点位置
- (void)Roate {
    
self.currentPoint = [self convertPoint:_offSet fromCoordinateSpace:self.boxView];
}


- (void)panAction:(UIGestureRecognizer *)pan {
    
    if (pan.state == UIGestureRecognizerStateChanged) {
        
        //修改附着点图片位置
        self.imagePoint.center = [pan locationInView:self];
        
        //修改附着行为的附着点
        _attach.anchorPoint = [pan locationInView:self];
        
        [self Roate];
        
        [self setNeedsDisplay];
    }
}

@end
