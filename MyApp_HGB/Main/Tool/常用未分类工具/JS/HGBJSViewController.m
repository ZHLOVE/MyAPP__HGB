//
//  HGBJSViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/14.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBJSViewController.h"
#import "HGBCallJSModel.h"

@interface HGBJSViewController ()

@end

@implementation HGBJSViewController
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
    titleLab.text=@"JS工具";
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
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30*wScale,64+5, kWidth-60*wScale, 60)];
    label.font=[UIFont systemFontOfSize:15.4];
    label.numberOfLines=0;
    label.text=@"JS工具请查看控制版打印:";
    [self.view addSubview:label];

    for(int i=0;i<2;i++){
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(30*wScale,64+10+70+36*i, kWidth-60*wScale, 30)];
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

            [button setTitle:@"JS字符串执行" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"js文件执行" forState:(UIControlStateNormal)];
        }


    }


}
-(void)buttonAction:(UIButton *)_b{

    if (_b.tag==0){
        NSLog(@"%@",[HGBCallJSModel callJSWithJSString:@"function hello(i){return 'hello'+i;}" WithFunction:@"hello" andWithArguments:@[@" world!"]]);
    }else if (_b.tag==1){
        NSLog(@"%@",[HGBCallJSModel callJSInJSFilePath:@"test.js" WithFunction:@"hello" andWithArguments:@[@" world!"]]);
    }
    
}
@end
