//
//  HGBFileCompressViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/14.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBFileCompressViewController.h"
#import "HGBCompressedFileTool.h"
#import "HGBFileManage.h"
@interface HGBFileCompressViewController ()

@end

@implementation HGBFileCompressViewController
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
    titleLab.text=@"压缩解压工具";
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=titleLab;


    //左键
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"返回"  style:UIBarButtonItemStylePlain target:self action:@selector(returnhandler)];
    [self.navigationItem.leftBarButtonItem setImageInsets:UIEdgeInsetsMake(0, -15, 0, 5)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    //右键
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"文件管理"  style:UIBarButtonItemStylePlain target:self action:@selector(fileHandle)];
    [self.navigationItem.rightBarButtonItem setImageInsets:UIEdgeInsetsMake(0, -15, 0, 5)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];

}
//返回
-(void)returnhandler{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)fileHandle{
    [HGBFileManage popFileManageControllerInParent:self];
}
#pragma mark UI
-(void)viewSetUp{
    self.view.backgroundColor=[UIColor colorWithRed:220.0/256 green:220.0/256 blue:220.0/256 alpha:1];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30*wScale,64+5, kWidth-60*wScale, 60)];
    label.font=[UIFont systemFontOfSize:15.4];
    label.numberOfLines=0;
    label.text=@"xml工具请查看右上角文件管理查看沙盒文件:";
    [self.view addSubview:label];

    for(int i=0;i<4;i++){
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

            [button setTitle:@"zip解压" forState:(UIControlStateNormal)];

        }else if (i==1){

            [button setTitle:@"7z解压" forState:(UIControlStateNormal)];
        }else if (i==2){

            [button setTitle:@"rar解压" forState:(UIControlStateNormal)];
        }else if (i==3){

            [button setTitle:@"压缩为zip" forState:(UIControlStateNormal)];
        }

    }


}
-(void)buttonAction:(UIButton *)_b{

    if (_b.tag==0){
        [HGBCompressedFileTool unArchive:@"1.zip" andPassword:nil toDestinationPath:@"Documents/1" andWithCompleteBlock:^(BOOL status, NSDictionary *messageInfo) {
             NSLog(@"%@",messageInfo);
        }];
    }else if (_b.tag==1){
        [HGBCompressedFileTool unArchive:@"1.7z" andPassword:nil toDestinationPath:@"Documents/2" andWithCompleteBlock:^(BOOL status, NSDictionary *messageInfo) {
            NSLog(@"%@",messageInfo);
        }];
    }else if (_b.tag==2){
        [HGBCompressedFileTool unArchive:@"1.rar" andPassword:nil toDestinationPath:@"Documents/3" andWithCompleteBlock:^(BOOL status, NSDictionary *messageInfo) {
            NSLog(@"%@",messageInfo);
        }];
    }else if (_b.tag==3){
        [HGBCompressedFileTool archiveToZipWithFilePaths:@[@"www"] toDestinationPath:@"Documents/4.zip" andWithCompleteBlock:^(BOOL status, NSDictionary *messageInfo) {
            NSLog(@"%@",messageInfo);
        }];
    }
    
}
@end
