//
//  LJCustomCollectionViewCell.m
//  CustomUICollectionView
//
//  Created by 李佳 on 15/9/24.
//  Copyright © 2015年 LiJia. All rights reserved.
//

#import "LJCustomCollectionViewCell.h"
static const CGFloat imageWidth = 100.f;

@interface LJCustomCollectionViewCell()
@property(nonatomic, strong)UIImageView* showImageView;
@end


@implementation LJCustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.showImageView = [[UIImageView alloc] init];
        self.showImageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.showImageView];
        
        int r = arc4random() % 255;
        int g = arc4random() % 255;
        int b = arc4random() % 225;
        
        self.backgroundColor = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1];
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.showImageView = [[UIImageView alloc] init];
        [self addSubview:self.showImageView];
        int r = arc4random() % 255;
        int g = arc4random() % 255;
        int b = arc4random() % 225;
        
        self.backgroundColor = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1];
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    [self compressImage:imageWidth imageName:_imageName];
}

- (void)compressImage:(float)width imageName:(NSString *)name
{
    self.showImageView.image = [UIImage imageNamed:name];
    
    float orgiWidth = [self.showImageView image].size.width;
    float orgiHeight = [self.showImageView image].size.height;
    
    float newWidth = width;
    float newHeight = (width * orgiHeight) / orgiWidth;
    
    [self.showImageView setFrame:CGRectMake(0, 0, newWidth, newHeight)];
}


@end
