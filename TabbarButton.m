//
//  TabbarButton.m
//  PetFriend
//
//  Created by wong on 15-12-24.
//  Copyright (c) 2015年 wong. All rights reserved.
//
#define TabBarButtonImageRatio 0.6
#import "TabbarButton.h"

@implementation TabbarButton

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [self setTitleColor:[UIColor colorWithRed:1.000f green:0.408f blue:0.616f alpha:1.00f] forState:(UIControlStateSelected)];
    }
    return self;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height *(TabBarButtonImageRatio * 0.6);
    return CGRectMake(0, 6, imageW, imageH+5);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * TabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item
{
    [self setTitle:item.title forState:(UIControlStateNormal)];
    [self setImage:item.image forState:(UIControlStateNormal)];
    [self setImage:item.selectedImage forState:(UIControlStateSelected)];
}
@end
