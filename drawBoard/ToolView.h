//
//  ToolView.h
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectColorView.h"
#import "SelectLineWidthView.h"

#pragma mark - 定义块代码
//typedef void(^ToolViewSelectEraserBlock)();
//typedef void(^ToolViewSelectUndoBlock)();
//typedef void(^ToolViewSelectClearScreenBlock)();
//typedef void(^ToolViewSelectCameraBlock)();
#pragma mark - 工具视图的操作块代码
typedef void(^ToolViewActionBlock)();

@interface ToolView:UIView

//扩展initWithFrame方法，增加块代码参数
-(id)initWithFrame:(CGRect)frame
  afterSelectColor:(SelectColorBlock)afterSelectColor
afterSelectLineWidth:(SelectLineWidthBlock)afterSelectLineWidth
 afterSelectEraser:(ToolViewActionBlock)afterSelectEraser
   afterSelectUndo:(ToolViewActionBlock)afterSelectUndo
afterSelectClearScreen:(ToolViewActionBlock)afterSelectClearScreen
 afterSelectCamera:(ToolViewActionBlock)afterSelectCamera;


@end
