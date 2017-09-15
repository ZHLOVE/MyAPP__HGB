//
//  HGBDateViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/13.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBDateViewController.h"

#import "HGBDatePicker.h"


/**
 名称:日期选择器


 调用:1.HGBDatePicker 日期选择器
 2.HGBDatePickerDelegate代理
 datePicker: didSelectedDate:获取日期
 datePicker:didSelectedDateToFormatDateString:获取日期字符串
 datePicker:didSelectedDateToYear: Month:month Day:获取时间
 datePickerDidClickedCanceled:取消


 功能:过去日期 未来日期-可设置年限 日期段  有默认



 framework:
 UIKit.framework
 */
@interface HGBDateViewController ()<HGBDatePickerDelegate>

@end

@implementation HGBDateViewController

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
    titleLab.text=@"日期选择";
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
    label.text=@"日期选择:可设置默认日期,起始日期，结束日期，标题";
    label.numberOfLines=0;
    label.font=[UIFont systemFontOfSize:15.4];
    [self.view addSubview:label];

    for(int i=0;i<3;i++){
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

            [button setTitle:@"日期" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"仅年月" forState:(UIControlStateNormal)];
        }else if (i==2){

            [button setTitle:@"仅月日" forState:(UIControlStateNormal)];
        }


    }


}
-(void)buttonAction:(UIButton *)_b{

    HGBDatePicker *picker=[HGBDatePicker instanceWithParent:self andWithDelegate:self];
    picker.titleStr=@"日期选择";
    if (_b.tag==0){

        picker.type=HGBDatePickerTypeNO;

    }else if (_b.tag==1){
        picker.type=HGBDatePickerTypeOnlyYearMonth;

    }else if (_b.tag==2){
        picker.type=HGBDatePickerTypeOnlyMonthDay;

    }
    [picker popInParentView];

}
#pragma mark
-(void)datePickerDidCanceled:(HGBDatePicker *)datePicker{
    NSLog(@"cancel");
}
-(void)datePicker:(HGBDatePicker *)datePicker didSelectedDate:(NSDate *)date{
    NSLog(@"%@",date);
}
-(void)datePicker:(HGBDatePicker *)datePicker didSelectedDateToFormatDateString:(NSString *)dateString{
    NSLog(@"%@",dateString);
}
-(void)datePicker:(HGBDatePicker *)datePicker didSelectedDateToYear:(NSString *)year Month:(NSString *)month Day:(NSString *)day{
    NSLog(@"%@-%@-%@",year,month,day);
}
@end
