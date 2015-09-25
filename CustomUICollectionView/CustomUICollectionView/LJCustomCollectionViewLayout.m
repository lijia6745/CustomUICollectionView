//
//  LJCustomCollectionViewLayout.m
//  CustomUICollectionView
//
//  Created by 李佳 on 15/9/24.
//  Copyright © 2015年 LiJia. All rights reserved.
//

#import "LJCustomCollectionViewLayout.h"
static const CGFloat imageWidth = 100.f;

@implementation LJCustomCollectionViewLayout

- (instancetype)init
{
    if (self = [super init])
    {
        self.imagesSizes = [[NSMutableArray alloc] init];
        self.columnHeights = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setColumnNumber:(NSUInteger)columnNumber
{
    _columnNumber = columnNumber;
    for (int i = 0; i < _columnNumber; ++i)
    {
        [self.columnHeights addObject:@0.0];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < self.cellCount; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0]; //我这里只有一个section
        
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [array addObject:attributes];
    }
    [self.columnHeights removeAllObjects];
    for (int i = 0; i < _columnNumber; ++i)
    {
        [self.columnHeights addObject:@0.0];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //获取位置
    CGFloat minHeight = [self.columnHeights[0] floatValue];
    NSUInteger columnNum = 0;
    for (int i = 1; i < self.columnNumber; ++i)
    {
        if ([self.columnHeights[i] floatValue] < minHeight)
        {
            minHeight = [self.columnHeights[i] floatValue];
            columnNum = i;
        }
    }
    //计算rect
    CGFloat yPos = minHeight + self.minimumLineSpacing;
    CGFloat xPos = self.leftmargin + columnNum * (imageWidth + self.minimumInteritemSpacing);
    
    CGSize size = [self.imagesSizes[indexPath.row] CGSizeValue];
    attributes.frame = CGRectMake(xPos, yPos, size.width, size.height);
    //更新columnhight;
    self.columnHeights[columnNum] = [NSNumber numberWithFloat:(yPos + size.height) * 1.f];
    return attributes;
}


@end
