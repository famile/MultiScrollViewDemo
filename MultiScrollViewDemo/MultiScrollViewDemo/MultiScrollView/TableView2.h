//
//  TableView2.h
//  MultiScrollViewDemo
//
//  Created by 李涛 on 2018/7/20.
//  Copyright © 2018年 Tao_Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
#import "MultiScrollViewHeader.h"

@interface TableView2 : UITableView

@property (nonatomic, weak) ViewController *mainVC;

@property (nonatomic, assign) OffsetTypes offsetType;
@end
