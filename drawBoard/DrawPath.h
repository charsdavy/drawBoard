//
//  DrawPath.h
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DrawPath:NSObject

+(id)drawPathWithCGPath:(CGPathRef)drawPath
                  color:(UIColor *)color
              lineWidth:(CGFloat)lineWidth;

@property (strong, nonatomic)UIBezierPath *drawPath;
@property (strong, nonatomic)UIColor *drawColor;
@property (assign, nonatomic)CGFloat lineWidth;

//用户选择的图像
@property (strong, nonatomic)UIImage *image;

@end
