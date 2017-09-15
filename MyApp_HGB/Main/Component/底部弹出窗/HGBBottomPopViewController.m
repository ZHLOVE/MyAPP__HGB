//
//  HGBBottomPopViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/13.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBBottomPopViewController.h"
#import "HGBBottomSheet.h"
#import "HGBTitleBottomSheet.h"



/**
 名称:底部弹窗


 调用:1.HGBBottomSheet 底部弹窗
 2.HGBTitleBottomSheet  底部弹窗-带标题底部按钮
 3.HGBBottomSheetDelegate代理
 bottomSheet:didClickButtonWithIndex：点击结果
 bottomSheetDidClickcancelButton:取消
 4.HGBScanControllerDelegate代理
 titleBottomSheet:didClickButtonWithIndex：点击结果
 titleBottomSheet:didClickSecondaryButtonWithIndex：andWithMainIndex：二级点击结果
 titleBottomSheetDidClickcancelButton:取消
 titleBottomSheetDidClickcancelButton:确定


 功能:底部弹窗

 framework:
 Foundation.framework
 UIKit.framework
 */

@interface HGBBottomPopViewController ()<HGBBottomSheetDelegate,HGBTitleBottomSheetDelegate>

@end

@implementation HGBBottomPopViewController

#pragma mark life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationItem];//导航栏
    [self viewSetUp];//UI

}
#pragma mark 导航栏
//导航栏
-(void)createNavigationItem
{
    //导航栏
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.0/256 green:191.0/256 blue:256.0/256 alpha:1];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.0/256 green:191.0/256 blue:256.0/256 alpha:1]];
    //标题
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 136*wScale, 16)];
    titleLab.font=[UIFont boldSystemFontOfSize:16];
    titleLab.text=@"底部弹出窗";
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=titleLab;


    //左键
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回"  style:UIBarButtonItemStylePlain target:self action:@selector(returnhandler)];
    [self.navigationItem.leftBarButtonItem setImageInsets:UIEdgeInsetsMake(0, -15, 0, 5)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];

}
//返回
-(void)returnhandler{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark UI
-(void)viewSetUp{
    self.view.backgroundColor=[UIColor colorWithRed:220.0/256 green:220.0/256 blue:220.0/256 alpha:1];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30*wScale,64+5, kWidth-60*wScale, 30)];
    label.text=@"底部弹窗";
    [self.view addSubview:label];

    for(int i=0;i<2;i++){
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(30*wScale,64+10+40+36*i, kWidth-60*wScale, 30)];
       button.backgroundColor=[UIColor blueColor];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        button.layer.masksToBounds=YES;
        button.layer.borderColor=[[UIColor grayColor]CGColor];
        button.layer.borderWidth=1;
        button.layer.cornerRadius=5;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        button.tag=i;

        [self.view addSubview:button];

        if (i==0){

            [button setTitle:@"底部选择" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"底部弹窗" forState:(UIControlStateNormal)];
        }


    }


}
-(void)buttonAction:(UIButton *)_b{

    if (_b.tag==0){
        HGBBottomSheet *bottom=[HGBBottomSheet instanceWithDelegate:self InParent:self];
        bottom.titles=@[@"选择1",@"选择2"];
        [bottom popInParentView];

    }else if (_b.tag==1){

        HGBTitleBottomSheet *bottom=[HGBTitleBottomSheet instanceWithDelegate:self InParent:self];
        bottom.dataSource=@[@{@"title":@"选择1",@"detail":@"选择1",@"type":@"0"},@{@"title":@"选择2",@"detail":@"选择2",@"type":@"1"},@{@"title":@"选择3",@"detail":@"选择3",@"type":@"2"}];
        bottom.popTitle=@"选择";
        bottom.okButtonTitle=@"选择";

        [bottom popInParentView];
    }
    
}
#pragma mark bottom
-(void)bottomSheetDidClickcancelButton:(HGBBottomSheet *)bottomSheet{
    NSLog(@"cancel");
}
-(void)bottomSheet:(HGBBottomSheet *)bottomSheet didClickButtonWithIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}
#pragma mark bottom title
-(void)titleBottomSheetDidClickOKButton:(HGBTitleBottomSheet *)titleBottomSheet{
    NSLog(@"ok");
}
-(void)titleBottomSheetDidClickCancelButton:(HGBTitleBottomSheet *)titleBottomSheet{
    NSLog(@"cancel");
}
-(void)titleBottomSheet:(HGBTitleBottomSheet *)titleBottomSheet didClickButtonWithIndex:(NSInteger)index{
     NSLog(@"%ld",index);
    titleBottomSheet.typeTitle=@"子选择";
    titleBottomSheet.typeDataSource=@[@{@"title":@"选择1",@"detail":@"选择1",@"type":@"0"},@{@"title":@"选择2",@"detail":@"选择2",@"type":@"1"},@{@"title":@"选择3",@"detail":@"选择3",@"type":@"2"}];
}
-(void)titleBottomSheet:(HGBTitleBottomSheet *)titleBottomSheet didClickSecondaryButtonWithIndex:(NSInteger)idx andWithMainIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}
@end
