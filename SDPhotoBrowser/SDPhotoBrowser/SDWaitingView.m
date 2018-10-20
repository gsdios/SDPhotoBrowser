//
//  SDWaitingView.m
//  SDPhotoBrowser
//
//  Created by aier on 15-2-6.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDWaitingView.h"

//// 图片下载进度指示器背景色
//#define SDWaitingViewBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]
//
//// 图片下载进度指示器内部控件间的间距
//
//#define SDWaitingViewItemMargin 10


@implementation SDWaitingView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = SDWaitingViewBackgroundColor;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.mode = SDWaitingViewModeLoopDiagram;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
//    NSLog(@"%@",[NSThread currentThread]);
    //将重绘操作放在主线程，解决自动布局控制台报错的问题
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self setNeedsDisplay];
        if (progress >= 1) {
            [self removeFromSuperview];
        }
    });
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor whiteColor] set];
    
    switch (self.mode) {
        case SDWaitingViewModePieDiagram:
            {
                CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - SDWaitingViewItemMargin;
                
                
                CGFloat w = radius * 2 + SDWaitingViewItemMargin;
                CGFloat h = w;
                CGFloat x = (rect.size.width - w) * 0.5;
                CGFloat y = (rect.size.height - h) * 0.5;
                CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
                CGContextFillPath(ctx);
                
                [SDWaitingViewBackgroundColor set];
                CGContextMoveToPoint(ctx, xCenter, yCenter);
                CGContextAddLineToPoint(ctx, xCenter, 0);
                CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; // 初始值
                CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 1);
                CGContextClosePath(ctx);
                
                CGContextFillPath(ctx);
            }
            break;
            
        default:
            {
                CGFloat width = self.lineWidth ? self.lineWidth : 15;
                CGContextSetLineWidth(ctx, width);
                CGContextSetLineCap(ctx, kCGLineCapRound);
                CGFloat to = - M_PI * 0.5 + self.progress * M_PI * 2 + 0.05; // 初始值0.05
                CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - width / 2;
                CGContextAddArc(ctx, xCenter, yCenter, radius, - M_PI * 0.5, to, 0);
                CGContextStrokePath(ctx);
            }
            break;
    }
}

@end
