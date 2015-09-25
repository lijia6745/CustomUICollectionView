//
//  LJUIScrollView.m
//  CustomUICollectionView
//
//  Created by 李佳 on 15/9/25.
//  Copyright © 2015年 LiJia. All rights reserved.
//

#import "LJUIScrollView.h"

@interface LJUIScrollView()
@property(nonatomic, strong)UIImageView* bigShowImageView;
@property(nonatomic, assign)CGFloat lastScale;
@end

@implementation LJUIScrollView
- (instancetype)init
{
    if (self = [super init])
    {
        self.bigShowImageView = [[UIImageView alloc] init];
        [self addSubview:self.bigShowImageView];
        self.bigShowImageView.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap:)];
        [self addGestureRecognizer:singleTapGestureRecognizer];
        
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGesture:)];
        pinchRecognizer.delegate = self;
        [self addGestureRecognizer:pinchRecognizer];
        
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.bigShowImageView.image = [UIImage imageNamed:_imageName];
    self.contentSize = CGSizeMake(self.bigShowImageView.image.size.width, self.bigShowImageView.image.size.height);
    self.bigShowImageView.bounds = CGRectMake(0, 0, self.bigShowImageView.image.size.width, self.bigShowImageView.image.size.height);
    self.bigShowImageView.center = self.center;
}

- (void)singleTap: (id)sender
{
    [self removeFromSuperview];
}

- (void)pinchGesture: (id)sender
{
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
    CGAffineTransform currentTransform = self.bigShowImageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [self.bigShowImageView setTransform:newTransform];
    
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
}


@end
