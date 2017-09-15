//
//  HGBPromptViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/13.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBPromptViewController.h"
#import "HGBPromptTool.h"

/**
 名称:提示弹窗


 调用:1.HGBAlertTool 提示弹窗封装
 2.HGBPromgressHud  吐司封装

 功能：提示弹窗

 framework:
 UIKit.framework
 */
@interface HGBPromptViewController ()

@end

@implementation HGBPromptViewController

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
    titleLab.text=@"提示窗";
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
    label.text=@"alert";
    [self.view addSubview:label];

    for(int i=0;i<5;i++){
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

            [button setTitle:@"单键-提示" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"单键-标题提示" forState:(UIControlStateNormal)];
        }else if (i==2){

            [button setTitle:@"单键-标题提示-功能" forState:(UIControlStateNormal)];

        }else if (i==3){

            [button setTitle:@"单键-标题提示-按钮功能-功能" forState:(UIControlStateNormal)];
        }else if (i==4){
            [button setTitle:@"双键-标题提示-按钮功能-功能" forState:(UIControlStateNormal)];
        }

        

    }

    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(30*wScale,64+40+36*5+10, kWidth-60*wScale, 30)];
    label2.text=@"hud:";
    [self.view addSubview:label2];

    for(int i=0;i<5;i++){
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(30*wScale,64+40+36*5+10+40+36*i, kWidth-60*wScale, 30)];
       button.backgroundColor=[UIColor blueColor];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        button.layer.masksToBounds=YES;
        button.layer.borderColor=[[UIColor grayColor]CGColor];
        button.layer.borderWidth=1;
        button.layer.cornerRadius=5;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
        button.tag=i+5;

        [self.view addSubview:button];

        if (i==0){

            [button setTitle:@"提示" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"提示-标题" forState:(UIControlStateNormal)];
        }else if (i==2){

            [button setTitle:@"提示-时间" forState:(UIControlStateNormal)];

        }else if (i==3){

            [button setTitle:@"底部提示" forState:(UIControlStateNormal)];
        }else if (i==4){

            [button setTitle:@"加载提示" forState:(UIControlStateNormal)];
        }


    }


}
-(void)buttonAction:(UIButton *)_b{

    if (_b.tag==0){
        [HGBAlertTool alertPrompt:@"hello world1" InParent:self];

    }else if (_b.tag==1){
        [HGBAlertTool alertPromptWithTitle:@"hello2" Detail:@"hello world2" InParent:self];

    }else if (_b.tag==2){
        [HGBAlertTool alertPromptWithTitle:@"hello3" Detail:@"hello world3" andWithSucessBlock:^{
            NSLog(@"hello world3");
        } InParent:self];


    }else if (_b.tag==3){
        [HGBAlertTool alertPromptWithTitle:@"hello4" Detail:@"hello world4" andWithButtonTitle:@"hello4" andWithSucessBlock:^{
            NSLog(@"hello world4");
        } InParent:self];

    }else if (_b.tag==4){
        [HGBAlertTool alertPromptWithTitle:@"hello5" Detail:@"hello world5" andWithButtonTitle:@[@"hello5-0",@"hello5-1"] andWithSucessBlock:^{
            NSLog(@"hello5-0");
        } andWithFailedblock:^{
             NSLog(@"hello5-1");
        } InParent:self];
        
    }else if (_b.tag==5){

        [HGBPromgressHud showHUDResult:@"hello6" ToView:self.view];
    }else if (_b.tag==6){
        [HGBPromgressHud setShowTitle:@"hello7"];
         [HGBPromgressHud showHUDResult:@"hello7" ToView:self.view];

    }else if (_b.tag==7){
        [HGBPromgressHud setShowDuration:5];
        [HGBPromgressHud setShowTitle:@"提示"];
        [HGBPromgressHud showHUDResult:@"hello8" ToView:self.view];

    }else if (_b.tag==8){
        [HGBPromgressHud setShowTitle:@"提示"];
        [HGBPromgressHud showHUDResult:@"hello" WithoutBackToView:self.view];

    }else if (_b.tag==9){
        [HGBPromgressHud showHUDSaveToView:self.view];
        [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [HGBPromgressHud hideSave];
        }];
        
    }

}

@end
