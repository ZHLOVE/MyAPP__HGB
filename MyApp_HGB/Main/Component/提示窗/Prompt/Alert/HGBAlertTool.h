//
//  HGBAlertTool.h
//  测试
//
//  Created by huangguangbao on 2017/8/9.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ SucessBlock)();
typedef void(^ FailedBlock)();

/**
 alert弹窗封装
 */
@interface HGBAlertTool : NSObject

/**
 *  单键
 *
 *  @param prompt     提示详情
 *
 *  @param parent 父控件
 */

+(void)alertPrompt:(NSString *)prompt InParent:(UIViewController *)parent;//提示信息

/**
 *  单键－标题提示
 *
 *  @param title    提示标题
 *  @param detail     提示详情
 *
 *  @param parent 父控件
 */
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail  InParent:(UIViewController *)parent;

/**
 *  单键-功能－标题
 *
 *  @param title    提示标题
 *  @param detail     提示详情
 *
 *  @param sucessBlock 成功返回
 *  @param parent 父控件
 */
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail andWithSucessBlock:(SucessBlock)sucessBlock InParent:(UIViewController *)parent;

/**
 *  单键-功能－按钮标题－标题
 *
 *  @param title    提示标题
 *  @param detail     提示详情
 *  @param buttonTitle  按钮标题
 *  @param sucessBlock 成功返回
 *  @param parent 父控件
 */
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail  andWithButtonTitle:(NSString *)buttonTitle andWithSucessBlock:(SucessBlock)sucessBlock InParent:(UIViewController *)parent;

/**
 *  双键-功能－标题
 *
 *  @param title    提示标题
 *  @param detail     提示详情
 *  @param buttonTitles    按钮名称
 *
 *  @param sucessBlock 成功返回
 *  @param failedBlock  失败返回
 *  @param parent 父控件
 */
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail andWithButtonTitle:(NSArray <NSString *>*)buttonTitles andWithSucessBlock:(SucessBlock) sucessBlock andWithFailedblock:( FailedBlock)failedBlock InParent:(UIViewController *)parent;//成功失败
@end
