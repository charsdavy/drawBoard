//
//  ViewController.m
//  drawBoard
//
//  Created by dengwei on 15/6/27.
//  Copyright (c) 2015年 dengwei. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "ToolView.h"

@interface ViewController ()

@property (weak, nonatomic)DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DrawView *drawView = [[DrawView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:drawView];
    self.drawView = drawView;
    
    ToolView *toolView = [[ToolView alloc]initWithFrame:CGRectMake(0, 0, 375, 44) afterSelectColor:^(UIColor *color) {
        //给绘图视图设置颜色
        [drawView setDrawColor:color];
 
        
    } afterSelectLineWidth:^(CGFloat lineWidth) {
        //给绘图视图设置线宽
        [drawView setLineWidth:lineWidth];

    } afterSelectEraser:^{
        [drawView setDrawColor:[UIColor whiteColor]];
        //[drawView setLineWidth:30.0];

    } afterSelectUndo:^{
        [drawView undoStep];
    } afterSelectClearScreen:^{
        [drawView clearScreen];
    } afterSelectCamera:^{
        //弹出图像选择窗口，来选择照片
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        
        //1.设置照片源
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        //2.设置代理
        [picker setDelegate:self];
        
        //3.显示
        [self presentViewController:picker animated:YES completion:nil];
    }];
    
    [self.view addSubview:toolView];
}

#pragma mark - 照片选择代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    
    //设置绘图视图
    [self.drawView setImage:image];
    
    //关闭照片选择窗口
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
