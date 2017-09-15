//
//  HGBFileManageController.h
//  测试
//
//  Created by huangguangbao on 2017/8/14.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGBFileManageController : UIViewController
/**
 根路径
 */
@property(strong,nonatomic)NSString *basePath;
/**
 是否显示各类文件夹切换base 自己设定的 及沙盒 bundle文件目录的切换
 */
@property(assign,nonatomic)BOOL withoutFileSwitch;

@end
