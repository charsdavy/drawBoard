//
//  DrawView.h
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView:UIView

@property (assign, nonatomic)CGFloat lineWidth;
@property (strong, nonatomic)UIColor *drawColor;
@property (strong, nonatomic)UIImage *image;

-(void)undoStep;
-(void)clearScreen;

@end
