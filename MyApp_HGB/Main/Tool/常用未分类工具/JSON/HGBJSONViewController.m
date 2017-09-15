//
//  HGBJSONViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/14.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBJSONViewController.h"
#import "HGBJSONTool.h"
@interface HGBJSONViewController ()

@end

@implementation HGBJSONViewController
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
    titleLab.text=@"JSON工具";
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
    label.text=@"JSON工具请查看控制版打印:";
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

            [button setTitle:@"数组或字典转为JSON字符串" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"JSON转Object" forState:(UIControlStateNormal)];
        }


    }


}
-(void)buttonAction:(UIButton *)_b{

    if (_b.tag==0){
        NSArray *array=@[@"huang",@"zhang",@"wang"];
        NSString *array_json=[HGBJSONTool ObjectToJSONString:array];
        NSLog(@"数组:%@-JSON字符串:%@",array,array_json);
        NSDictionary *dic=@{@"name":@"huang",@"age":@"27"};
        NSString *dic_json=[HGBJSONTool ObjectToJSONString:dic];
        NSLog(@"字典:%@-JSON字符串:%@",dic,dic_json);
    }else if (_b.tag==1){
        NSString *array_json=@"['huang','zhang']";

        NSArray *array=[HGBJSONTool JSONStringToObject:array_json];

        NSLog(@"JSON字符串:%@-数组:%@",array,array_json);
         NSString *dic_json=@"{'name':'zhang'}";
        NSDictionary *dic=[HGBJSONTool JSONStringToObject:dic_json];
        NSLog(@"JSON字符串:%@-字典:%@",dic_json,dic);
    }
    
}
@end
