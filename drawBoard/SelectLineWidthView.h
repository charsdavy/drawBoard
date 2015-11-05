//
//  SelectLineWidthView.h
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 定义块代码
typedef void(^SelectLineWidthBlock)(CGFloat lineWidth);

@interface SelectLineWidthView:UIView

//扩展initWithFrame方法，增加块代码参数
//该块代码将在选择线宽按钮之后执行
-(id)initWithFrame:(CGRect)frame afterSelectLineWidth:(SelectLineWidthBlock)afterSelectLineWidth;


@end
