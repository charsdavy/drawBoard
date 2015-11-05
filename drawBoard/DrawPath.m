//
//  DrawPath.m
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "DrawPath.h"

@implementation DrawPath

+(id)drawPathWithCGPath:(CGPathRef)drawPath
                  color:(UIColor *)color
              lineWidth:(CGFloat)lineWidth
{
    DrawPath *path = [[DrawPath alloc]init];
    
    path.drawPath = [UIBezierPath bezierPathWithCGPath:drawPath];
    path.drawColor = color;
    path.lineWidth = lineWidth;
    
    return path;
}


@end
