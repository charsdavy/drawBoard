//
//  SelectLineWidthView.m
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "SelectLineWidthView.h"

//针对不同的界面，因为按钮的数量是不同的，有时候需要调整按钮间距，保证好的视觉效果
#define kButtonSpace 10.0

@interface SelectLineWidthView()
{
    SelectLineWidthBlock _selectLineWidthBlock;
}

@property (strong, nonatomic)NSArray *lineWidthArray;

@end

@implementation SelectLineWidthView

-(id)initWithFrame:(CGRect)frame afterSelectLineWidth:(SelectLineWidthBlock)afterSelectLineWidth
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _selectLineWidthBlock = afterSelectLineWidth;
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
        
        //绘制颜色的按钮
        NSArray *array = @[@(1.0),@(3.0),@(5.0),@(8.0),@(10.0),@(15.0),@(20.0)];
        
        self.lineWidthArray = array;
        [self createLineWidthButtonsWithArray:array];
    }
    
    return self;
}

#pragma mark - 创建选择线宽的按钮
-(void)createLineWidthButtonsWithArray:(NSArray *)array
{
    //1.计算按钮的位置
    //2.设置按钮的颜色，需要使用数组
    //需要按钮的宽度，起始点位置
    NSInteger index = 0;
    NSInteger count = array.count;
    CGFloat width = (self.bounds.size.width - (count + 1) * kButtonSpace) / count;
    CGFloat height = self.bounds.size.height;
    
    for(NSString *text in array){
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat startX = kButtonSpace + index * (width + kButtonSpace);
        [button setFrame:CGRectMake(startX, kButtonSpace / 2, width, height - 10)];
        //设置选择线宽的提示文字
        NSString *textTip = [NSString stringWithFormat:@"%@", self.lineWidthArray[index]];
        [button setTitle:textTip forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:16.0]];

        [button setTag:index];
        
        
        [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        index++;
    }

}

#pragma mark - 按钮监听方法
-(void)tapButton:(UIButton *)button
{
    //把按钮对应的线宽数值作为块代码参数，执行块代码
    _selectLineWidthBlock([self.lineWidthArray[button.tag]floatValue]);

}

@end
