//
//  HGBTimeViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/13.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBTimeViewController.h"


#import "HGBTimePicker.h"





/**
 名称:时间选择器


 调用:1.HGBTimePicker 时间选择器
 2.HGBTimePickerDelegate代理
 timePicker:didSelectedTime：获取时间
 timePicker:didSelectedTimeToFormatTimeString：获取时间字符串
 timePicker:didSelectedTimeToHour: Minute:Second:获取时间
 timePicker:timePickerDidClickedCanceled：取消


 功能:过去时间 未来时间-可设置小时数 时间段  有默认



 framework:
 UIKit.framework
 */
@interface HGBTimeViewController ()<HGBTimePickerDelegate>

@end

@implementation HGBTimeViewController

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
    titleLab.text=@"时间选择";
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
    label.text=@"时间选择:可以设置起始时间，结束时间,默认时间,标题";
    label.numberOfLines=0;
    label.font=[UIFont systemFontOfSize:15.4];
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

            [button setTitle:@"时间" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"仅时分" forState:(UIControlStateNormal)];
        }
       


    }


}
-(void)buttonAction:(UIButton *)_b{

     HGBTimePicker *picker=[HGBTimePicker instanceWithParent:self andWithDelegate:self];
     picker.titleStr=@"时间选择";
    if (_b.tag==0){

        picker.type=HGBTimePickerTypeNO;

    }else if (_b.tag==1){
        picker.type=HGBTimePickerTypeOnlyHourMinute;

    }
    [picker popInParentView];

}
#pragma mark
-(void)timePickerDidCanceled:(HGBTimePicker *)timePicker{
    NSLog(@"cancel");
}
-(void)timePicker:(HGBTimePicker *)timePicker didSelectedTime:(NSDate *)time{
    NSLog(@"%@",time);
}
-(void)timePicker:(HGBTimePicker *)timePicker didSelectedTimeToFormatTimeString:(NSString *)timeString{
    NSLog(@"%@",timeString);
}
-(void)timePicker:(HGBTimePicker *)timePicker didSelectedTimeToHour:(NSString *)hour Minute:(NSString *)minute Second:(NSString *)second{
    NSLog(@"%@-%@-%@",hour,minute,second);
}

@end
