//
//  PushViewControllerWithSearchData.m
//  HealthExpo
//
//  Created by Weixu on 16/8/15.
//  Copyright © 2016年 AllWantsLab. All rights reserved.
//

#import "PushViewControllerWithSearchData.h"
#import "JiBingDetailViewController.h"
#import "YiYuanViewController.h"
#import "YiMiaoDetailViewController.h"
#import "MIngYiViewController.h"


@implementation PushViewControllerWithSearchData
+ (void)pushViewControllerWithdata:(SearchObject *)aObject oldViewController:(UIViewController *)aViewController{
    
    switch (aObject.searchtype) {
        case NEWS: {
            JiBingDetailViewController *vc = [[JiBingDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
            vc.cid =aObject.id;
            vc.hidesBottomBarWhenPushed = YES;
            [aViewController.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        case JIBING: {
            JiBingDetailViewController *vc = [[JiBingDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
            vc.cid =aObject.id;
            vc.hidesBottomBarWhenPushed = YES;
            [aViewController.navigationController pushViewController:vc animated:YES];
            break;
        }
        case YILIAOJIGOU: {
            YiYuanViewController *vc = [[YiYuanViewController alloc] initWithNibName:@"YiYuanViewController" bundle:nil];
            vc.cid =aObject.id;
            vc.hidesBottomBarWhenPushed = YES;
            [aViewController.navigationController pushViewController:vc animated:YES];
            break;
        }
        case ZAZHI: {
            JiBingDetailViewController *vc = [[JiBingDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
            vc.cid =aObject.id;
            vc.hidesBottomBarWhenPushed = YES;
            [aViewController.navigationController pushViewController:vc animated:YES];
            break;
        }
        case YIMIAO: {
            YiMiaoDetailViewController *vc = [[YiMiaoDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
            vc.cid =aObject.id;
            vc.hidesBottomBarWhenPushed = YES;
            [aViewController.navigationController pushViewController:vc animated:YES];
            break;
        }
        case MINGYI: {
            MIngYiViewController *vc = [[MIngYiViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
            vc.cid =aObject.id;
            vc.hidesBottomBarWhenPushed = YES;
            [aViewController.navigationController pushViewController:vc animated:YES];
            break;
        }
        case ZASHIMULU: {
            JiBingDetailViewController *vc = [[JiBingDetailViewController alloc] initWithNibName:@"JiBingDetailViewController" bundle:nil];
            vc.cid =aObject.id;
            vc.hidesBottomBarWhenPushed = YES;
            [aViewController.navigationController pushViewController:vc animated:YES];
            break;
        }
    }
}
@end
