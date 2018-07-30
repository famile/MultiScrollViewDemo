//
//  MultiScrollViewHeader.h
//  MultiScrollViewDemo
//
//  Created by 李涛 on 2018/7/20.
//  Copyright © 2018年 Tao_Lee. All rights reserved.
//

#ifndef MultiScrollViewHeader_h
#define MultiScrollViewHeader_h

#define SCREEN_HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)
#define SCREEN_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)
#define WEAK_SELF __weak __typeof(self) weakSelf = self;
#define kHeightSectionHeader 50
#define kHeightDetailCell (SCREEN_HEIGHT-kHeightSectionHeader)

typedef NS_ENUM(NSUInteger, OffsetTypes) {
    OffsetTypeMax = 1,
    OffsetTypeOther,
};

#endif /* MultiScrollViewHeader_h */
