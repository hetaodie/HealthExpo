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
#import "NewsDetailViewController.h"
#import "DianZiZaZhiDetailViewController.h"


@implementation PushViewControllerWithSearchData
+ (void)pushViewControllerWithdata:(SearchObject *)aObject oldViewController:(UIViewController *)aViewController{
    
    switch (aObject.searchtype) {
        case NEWS: {
            NewsDetailViewController *vc = [[NewsDetailViewController alloc] initWithNibName:@"NewsDetailViewController" bundle:nil];
            vc.newsID =[NSString stringWithFormat:@"%ld",aObject.id];
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
            DianZiZaZhiDetailViewController *vc = [[DianZiZaZhiDetailViewController alloc] initWithNibName:@"DianZiZaZhiDetailViewController" bundle:nil];
            [vc fillDetailID:[NSString stringWithFormat:@"%ld",aObject.id] andTitle:aObject.title];
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
