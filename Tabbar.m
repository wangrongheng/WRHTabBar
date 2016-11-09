//
//  Tabbar.m
//  PetFriend
//
//  Created by wong on 15-12-24.
//  Copyright (c) 2015年 wong. All rights reserved.
//

#import "Tabbar.h"
#import "TabbarButton.h"

@interface Tabbar()
{
}

@property (nonatomic, strong) NSMutableArray * tabBarButtons;
@property (nonatomic, weak) TabbarButton * selectedButton;

@end

@implementation Tabbar


- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    TabbarButton * button = [[TabbarButton alloc] init];
    [self addSubview:button];
    
    [self.tabBarButtons addObject:button];
    // 设置数据
    button.item = item;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
  
    // 默认选中View
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

- (void)buttonClick:(TabbarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    CGFloat h =  self.frame.size.height;
    CGFloat w =  self.frame.size.width;
    
    
    CGFloat buttonY = 0;
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.subviews.count;
    for (NSInteger index = 0; index < self.tabBarButtons.count; index++) {
        // 1.取出button
        TabbarButton * button = self.tabBarButtons[index];
        // 2.设置frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;
        if (index == 2) {
        }
    }
   
}

@end
