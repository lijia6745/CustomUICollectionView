//
//  LJCustomCollectionViewController.m
//  CustomUICollectionView
//
//  Created by 李佳 on 15/9/24.
//  Copyright © 2015年 LiJia. All rights reserved.
//

#import "LJCustomCollectionViewController.h"
#import "LJCustomCollectionViewCell.h"
#import "LJCustomCollectionViewLayout.h"
#import "LJUIScrollView.h"

static const int pictureCount = 26;
static const CGFloat imageWidth = 100.f;

@interface LJCustomCollectionViewController ()

@end

@implementation LJCustomCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    LJCustomCollectionViewLayout* layout = [[LJCustomCollectionViewLayout alloc] init];
    self.collectionView.collectionViewLayout = layout;
    layout.minimumInteritemSpacing = 0;
    layout.cellCount = pictureCount;
    CGSize superViewSize = self.view.frame.size;;
    int columnNumber = (int)superViewSize.width / (int)100.f;
    layout.columnNumber = columnNumber;
    layout.totalWidth = self.view.frame.size.width;
    layout.minimumLineSpacing = 5.0;
    
    [self.collectionView registerClass:[LJCustomCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.frame = self.view.bounds;
    self.collectionView.backgroundColor = [UIColor whiteColor];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return pictureCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJCustomCollectionViewCell *cell = (LJCustomCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString* fileName = [NSString stringWithFormat:@"pic_%ld.jpg", indexPath.row + 1];
    cell.imageName = fileName;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize imageSize = CGSizeZero;
    NSString* fileName = [NSString stringWithFormat:@"pic_%ld.jpg", indexPath.row + 1];
    imageSize = [self getSizeWithImageName:fileName];
    LJCustomCollectionViewLayout* layout = (LJCustomCollectionViewLayout*)self.collectionView.collectionViewLayout;
    [layout.imagesSizes addObject:[NSValue valueWithCGSize:imageSize]];
    
    return imageSize;
}


- (CGSize)getSizeWithImageName: (NSString*)imageName
{
    UIImage* image = [UIImage imageNamed:imageName];
    
    float orgiWidth = image.size.width;
    float orgiHeight = image.size.height;
    
    float newWidth = imageWidth;
    float newHeight = (imageWidth * orgiHeight) / orgiWidth;
    
    return CGSizeMake(newWidth, newHeight);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGSize superViewSize = self.view.frame.size;;
    CGFloat lastSpace = (int)superViewSize.width % (int)100.f;
    CGFloat margin = lastSpace / 2.f;
    LJCustomCollectionViewLayout* layout = (LJCustomCollectionViewLayout*)self.collectionView.collectionViewLayout;
    layout.leftmargin = margin;
    return UIEdgeInsetsMake(0, margin, 0, margin);
}
#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LJCustomCollectionViewCell* cell = (LJCustomCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    LJUIScrollView* showBigImageScrollView = [[LJUIScrollView alloc] init];
    showBigImageScrollView.backgroundColor = [UIColor whiteColor];
    showBigImageScrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    showBigImageScrollView.imageName = cell.imageName;
    
    [self.view addSubview:showBigImageScrollView];
}

@end
