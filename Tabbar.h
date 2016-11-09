//
//  Tabbar.h
//  PetFriend
//
//  Created by wong on 15-12-24.
//  Copyright (c) 2015年 wong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Tabbar;
@protocol TabBarDelegate <NSObject>

@optional
- (void)tabBar:(Tabbar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface Tabbar : UIView

@property (nonatomic, weak) id<TabBarDelegate> delegate;

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end
