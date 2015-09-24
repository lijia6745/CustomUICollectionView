//
//  LJCustomCollectionViewLayout.h
//  CustomUICollectionView
//
//  Created by 李佳 on 15/9/24.
//  Copyright © 2015年 LiJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJCustomCollectionViewLayout : UICollectionViewFlowLayout
@property(nonatomic, assign)NSUInteger cellCount;
@property(nonatomic, assign)NSUInteger columnNumber;
@property(nonatomic, assign)CGFloat totalWidth;
@property(nonatomic, strong)NSMutableArray* imagesSizes;
@property(nonatomic, strong)NSMutableArray* columnHeights;
@property(nonatomic, assign)CGFloat leftmargin;
@end
