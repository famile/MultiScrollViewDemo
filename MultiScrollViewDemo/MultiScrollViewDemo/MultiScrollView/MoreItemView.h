//
//  MoreItemView.h
//  MultiScrollViewDemo
//
//  Created by 李涛 on 2018/7/23.
//  Copyright © 2018年 Tao_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreItemView : UIView

@property (nonatomic, copy) void(^clickItemBtn)(NSInteger index);

- (void)updateItemWithIndex:(NSInteger)index;

@end
