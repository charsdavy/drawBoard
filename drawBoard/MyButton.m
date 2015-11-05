//
//  MyButton.m
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    //如果按钮被选中则在按钮的下方画一条红线
    if (self.selectedMyButton) {
        CGRect frame = CGRectMake(0, self.bounds.size.height - 2, self.bounds.size.width, 2);
        
        [[UIColor redColor]set];
        UIRectFill(frame);
    }
}

#pragma mark - setter方法
-(void)setSelectedMyButton:(BOOL)selectedMyButton
{
    _selectedMyButton = selectedMyButton;
    
    [self setNeedsDisplay];
}

@end
