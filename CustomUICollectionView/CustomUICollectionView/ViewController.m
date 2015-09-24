//
//  ViewController.m
//  CustomUICollectionView
//
//  Created by 李佳 on 15/9/24.
//  Copyright © 2015年 LiJia. All rights reserved.
//

#import "LJCustomCollectionViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self pushCustomCollectionViewController:nil];
    
    UIButton* btn = [[UIButton alloc] init];
    [btn addTarget:self action:@selector(pushCustomCollectionViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 80, 20);
    [btn setTitle:@"瀑布流" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
}

- (void)pushCustomCollectionViewController: (id)sender
{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    LJCustomCollectionViewController* imageShowCrl = [[LJCustomCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:imageShowCrl animated:YES];
}

@end
