//
//  SelectColorView.m
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "SelectColorView.h"

#define kButtonSpace 10.0

@interface SelectColorView()
{
    //选择颜色的块代码变量
    SelectColorBlock _selectColorBlock;
}

@property (strong, nonatomic)NSArray *colorArray;

@end

@implementation SelectColorView

-(id)initWithFrame:(CGRect)frame afterSelectColor:(SelectColorBlock)afterSelectColor
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _selectColorBlock = afterSelectColor;
        
        [self setBackgroundColor:[UIColor lightGrayColor]];
        
        //绘制颜色的按钮
        NSArray *array = @[[UIColor darkGrayColor],
                           [UIColor redColor],
                           [UIColor greenColor],
                           [UIColor blueColor],
                           [UIColor yellowColor],
                           [UIColor orangeColor],
                           [UIColor purpleColor],
                           [UIColor brownColor],
                           [UIColor blackColor]
                           ];
        
        self.colorArray = array;
        [self createColorButtonsWithArray:array];
        
    }
    
    return self;
}

#pragma mark - 绘制颜色的按钮
-(void)createColorButtonsWithArray:(NSArray *)array
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
        //设置按钮背景颜色
        [button setBackgroundColor:array[index]];
        [button setTag:index];
        
        
        [button addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        index++;
    }
}

#pragma mark - 按钮监听方法
-(void)tapButton:(UIButton *)button
{
    //调用块代码
    _selectColorBlock(self.colorArray[button.tag]);
    
}


@end
