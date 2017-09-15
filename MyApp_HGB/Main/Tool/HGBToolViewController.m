//
//  HGBToolViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/12.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBToolViewController.h"
#import "HGBCommonSelectCell.h"
#import "HGBJSONViewController.h"
#import "HGBXMLViewController.h"
#import "HGBJSViewController.h"
#import "HGBFileManage.h"
#import "HGBFileCompressViewController.h"
#import "HGBOUTViewController.h"
#import "HGBQuickLookViewController.h"

#define kWidth [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]//系统版本号
//屏幕比例
#define wScale kWidth / 750.0
#define hScale kHeight / 1334.0

#define Identify_Cell @"cell"

@interface HGBToolViewController ()
/**
 数据源
 */
@property(strong,nonatomic)NSDictionary *dataDic;
/**
 数据源
 */
@property(strong,nonatomic)NSArray *keys;
@end

@implementation HGBToolViewController

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
    titleLab.text=@"组件";
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=titleLab;


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
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, kWidth, kHeight-44) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor colorWithRed:220.0/256 green:220.0/256 blue:220.0/256 alpha:1];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    self.dataDic=@{@"常用未分类工具类":@[@"JSON工具",@"XML工具",@"JS工具",@"崩溃收集工具",@"常用线程工具",@"APP自检工具",@"加密工具",@"网络工具",@"谓词(正则)工具",@"字符串工具",@"时间工具"],@"文件工具":@[@"数据库工具",@"文件压缩工具",@"html转pdf工具",@"文件工具",@"沙盒工具",@"清除缓存工具",@"文件管理工具(开发)",@"使用外部app打开文件工具",@"quickLook工具"]};
    self.keys=[self.dataDic allKeys];


    [self.tableView registerClass:[HGBCommonSelectCell class] forCellReuseIdentifier:Identify_Cell];
    [self.tableView reloadData];
}
#pragma mark table view delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.keys.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 72 * hScale;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 72* hScale)];
    headView.backgroundColor = [UIColor colorWithRed:220.0/256 green:220.0/256 blue:220.0/256 alpha:1];
    //信息提示栏
    UILabel *tipMessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(32 * wScale, 0, kWidth - 32 * wScale, CGRectGetHeight(headView.frame))];
    tipMessageLabel.backgroundColor = [UIColor clearColor];
    NSString *key=self.keys[section];
    tipMessageLabel.text = key;
    tipMessageLabel.textColor = [UIColor grayColor];
    tipMessageLabel.textAlignment = NSTextAlignmentLeft;
    tipMessageLabel.font = [UIFont systemFontOfSize:12.0];
    tipMessageLabel.numberOfLines = 0;
    [headView addSubview:tipMessageLabel];
    return headView;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key=self.keys[section];
    NSArray *data=self.dataDic[key];
    return data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HGBCommonSelectCell *cell=[tableView dequeueReusableCellWithIdentifier:Identify_Cell forIndexPath:indexPath];
    NSString *key=self.keys[indexPath.section];
    NSArray *data=self.dataDic[key];
    NSString *string=[data objectAtIndex:indexPath.row];
    cell.title.text=string;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section==0){
        if(indexPath.row==0){
            [self pushController:[[HGBJSONViewController alloc]init]];
        }else if (indexPath.row==1){
            [self pushController:[[HGBXMLViewController alloc]init]];
        }else if (indexPath.row==2){
            [self pushController:[[HGBJSViewController alloc]init]];
        }else if (indexPath.row==3){
//            [self pushController:[[HGBDateViewController alloc]init]];
        }else if (indexPath.row==4){
//            [self pushController:[[HGBTimeViewController alloc]init]];
        }else if (indexPath.row==5){
//            [self pushController:[[HGBBottomSelectViewController alloc]init]];
        }
    }else if(indexPath.section==1){
        if(indexPath.row==0){
//            [self pushController:[[HGBJSONViewController alloc]init]];
        }else if (indexPath.row==1){
            [self pushController:[[HGBFileCompressViewController alloc]init]];
        }else if (indexPath.row==2){
//            [self pushController:[[HGBJSViewController alloc]init]];
        }else if (indexPath.row==3){
            //            [self pushController:[[HGBDateViewController alloc]init]];
        }else if (indexPath.row==4){
            //            [self pushController:[[HGBTimeViewController alloc]init]];
        }else if (indexPath.row==5){
            //            [self pushController:[[HGBBottomSelectViewController alloc]init]];
        }else if (indexPath.row==6){
            [HGBFileManage popFileManageControllerInParent:self];
        }else if (indexPath.row==7){
                        [self pushController:[[HGBOUTViewController alloc]init]];
        }else if (indexPath.row==8){
                        [self pushController:[[HGBQuickLookViewController alloc]init]];
        }
    }
}
-(void)pushController:(UIViewController*)controller{
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:controller];
    [self.tabBarController presentViewController:nav animated:YES completion:nil];
}
#pragma mark get
-(NSDictionary *)dataDic{
    if(_dataDic==nil){
        _dataDic=[NSDictionary dictionary];
    }
    return _dataDic;
}
-(NSArray *)keys{
    if(_keys==nil){
        _keys=[NSArray array];
    }
    return _keys;
}
@end
