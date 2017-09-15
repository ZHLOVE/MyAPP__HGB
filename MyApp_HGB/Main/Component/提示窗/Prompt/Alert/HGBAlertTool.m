//
//  HGBAlertTool.m
//  测试
//
//  Created by huangguangbao on 2017/8/9.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBAlertTool.h"

#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]//系统版本号
#define VERSION 8.0//界限版本号

@interface HGBAlertTool()<UIAlertViewDelegate>
@property(strong,nonatomic)SucessBlock sucessBlock;
@property(strong,nonatomic)SucessBlock failBlock;
@property(assign,nonatomic)NSInteger index;
@end

@implementation HGBAlertTool
#pragma mark init
static HGBAlertTool *instance=nil;
+ (instancetype)shareInstance
{
    if (instance==nil) {
        instance=[[HGBAlertTool alloc]init];
    }
    return instance;
}
#pragma mark func
/**
 *  单键
 *
 *  @param prompt     提示详情
 *
 *  @param parent 父控件
 */
+(void)alertPrompt:(NSString *)prompt InParent:(UIViewController *)parent{
    if(SYSTEM_VERSION<VERSION){
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:prompt delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertview show];
    }else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"温馨提示" message:prompt preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:action];
        [parent presentViewController:alert animated:YES completion:nil];
    }

}


/**
 *  单键－标题
 *
 *  @param title    提示标题
 *  @param detail     提示详情
 *
 *  @param parent 父控件
 */
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail InParent:(UIViewController *)parent
{
    if(SYSTEM_VERSION<VERSION){
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title message:detail delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertview show];
    }else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:detail preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action1=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {

            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:action1];
        [parent presentViewController:alert animated:YES completion:nil];
    }


}
/**
 *  单键-功能－标题
 *
 *  @param title    提示标题
 *  @param detail     提示详情
 *
 *  @param sucessBlock 成功返回
 *  @param parent 父控件
 */
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail andWithSucessBlock:(SucessBlock)sucessBlock InParent:(UIViewController *)parent
{

    if(SYSTEM_VERSION<VERSION){
        instance.sucessBlock=sucessBlock;
        [HGBAlertTool shareInstance];
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title message:detail delegate:instance cancelButtonTitle:@"确定" otherButtonTitles:nil];
        instance.index=2;
        [alertview show];
    }else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:detail preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action1=[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            sucessBlock();
        }];
        [alert addAction:action1];
        [parent presentViewController:alert animated:YES completion:nil];
    }


}
/**
 *  单键-功能－按钮标题－标题
 *
 *  @param title    提示标题
 *  @param detail     提示详情
 *  @param buttonTitle     按钮标题
 *  @param sucessBlock 成功返回
 *  @param parent 父控件
 */
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail  andWithButtonTitle:(NSString *)buttonTitle andWithSucessBlock:(SucessBlock)sucessBlock InParent:(UIViewController *)parent{

    if(SYSTEM_VERSION<VERSION){
        instance.sucessBlock=sucessBlock;
        [HGBAlertTool shareInstance];
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title message:detail delegate:instance cancelButtonTitle:buttonTitle otherButtonTitles:nil];
        instance.index=3;
        [alertview show];
    }else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:detail preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action1=[UIAlertAction actionWithTitle:buttonTitle style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            sucessBlock();
        }];
        [alert addAction:action1];
        [parent presentViewController:alert animated:YES completion:nil];
    }

}
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
+(void)alertPromptWithTitle:(NSString *)title Detail:(NSString *)detail andWithButtonTitle:(NSArray<NSString *> *)buttonTitles andWithSucessBlock:(SucessBlock)sucessBlock andWithFailedblock:(FailedBlock)failedBlock InParent:(UIViewController *)parent
{
    if(buttonTitles.count<2){
        return;
    }
    if(SYSTEM_VERSION<VERSION){
        [HGBAlertTool shareInstance];
        instance.sucessBlock=sucessBlock;
        instance.failBlock =failedBlock;
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title message:detail delegate:instance cancelButtonTitle:buttonTitles[0] otherButtonTitles:buttonTitles[1],nil];
        instance.index=4;
        [alertview show];
    }else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:detail preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action1=[UIAlertAction actionWithTitle:buttonTitles[0] style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            sucessBlock();
        }];
        [alert addAction:action1];
        UIAlertAction *action2=[UIAlertAction actionWithTitle:buttonTitles[1] style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            failedBlock();
        }];
        [alert addAction:action2];
        [parent presentViewController:alert animated:YES completion:nil];
    }

}

#pragma mark delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(instance.index==2||instance.index==3){
        if(instance.sucessBlock){
            instance.sucessBlock();
        }
    }else if (instance.index==4){
        if(buttonIndex==0){
            if(instance.sucessBlock){
                instance.sucessBlock();
            }
        }else{
            if(instance.failBlock){
                instance.failBlock();
            }

        }

    }
}
@end
