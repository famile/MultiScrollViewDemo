//
//  MoreItemView.m
//  MultiScrollViewDemo
//
//  Created by 李涛 on 2018/7/23.
//  Copyright © 2018年 Tao_Lee. All rights reserved.
//

#import "MoreItemView.h"

@interface MoreItemView()
@property (weak, nonatomic) IBOutlet UIButton *btn1;

@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation MoreItemView
- (void)awakeFromNib{
    [super awakeFromNib];
    [_btn1 setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [_btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
}
- (IBAction)clickitem1:(id)sender {
    if (self.clickItemBtn) {
        self.clickItemBtn(0);
    }
    [_btn1 setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [_btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
}
- (IBAction)clickItem2:(id)sender {
    self.clickItemBtn(1);
    [_btn2 setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    [_btn1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
}

- (void)updateItemWithIndex:(NSInteger)index{
    if (index == 0) {
        [_btn1 setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
        [_btn2 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }else{
        [_btn2 setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
        [_btn1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    }
}

@end
