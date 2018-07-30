//
//  ViewController.m
//  MultiScrollViewDemo
//
//  Created by 李涛 on 2018/7/20.
//  Copyright © 2018年 Tao_Lee. All rights reserved.
//

#import "ViewController.h"
#import "MultiScrollViewHeader.h"
#import "TableView1.h"
#import "TableView2.h"
#import "MoreItemView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *containerView;
@property (nonatomic, strong) TableView1 *tableView1;
@property (nonatomic, strong) TableView2 *tableView2;

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) MoreItemView *sectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nullCell0"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"nullCell0"];
        }
        
        cell.backgroundColor = [UIColor orangeColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nullCell1"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"nullCell1"];
            
            UIScrollView *subScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kHeightDetailCell)];
            subScrollView.bounces = NO;
            [subScrollView setContentSize:CGSizeMake(SCREEN_WIDTH*2, kHeightDetailCell)];
            subScrollView.pagingEnabled = YES;
            subScrollView.showsHorizontalScrollIndicator = NO;
            subScrollView.delegate = self;
            [cell addSubview:subScrollView];
            _containerView = subScrollView;
            
            _tableView1 = [[TableView1 alloc] initWithFrame:(CGRectMake(0, 0, SCREEN_WIDTH, kHeightDetailCell)) style:(UITableViewStylePlain)];
            _tableView1.backgroundColor = [UIColor whiteColor];
            _tableView1.mainVC = self;
            
            [subScrollView addSubview:_tableView1];
            
            
            _tableView2 = [[TableView2 alloc] initWithFrame:(CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, kHeightDetailCell)) style:(UITableViewStylePlain)];
            _tableView2.backgroundColor = [UIColor whiteColor];
            _tableView2.mainVC = self;
            
            [subScrollView addSubview:_tableView2];
        
            
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
    }
}

#pragma mark - UIScrollViewDelegate
//UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if ([scrollView isEqual:_containerView]) {
        _tableView1.scrollEnabled = NO;
        _tableView2.scrollEnabled = NO;
    }
    
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if ([scrollView isEqual:_containerView]) {
        _tableView1.scrollEnabled = YES;
        _tableView2.scrollEnabled = YES;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual:_tableView]) {
//        NSLog(@"%lf, %lf", scrollView.contentOffset.y, scrollView.contentSize.height-scrollView.frame.size.height);
       
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height-scrollView.frame.size.height-0.5)) {
            _offsetType = OffsetTypeMax;
        }else{
            _offsetType = OffsetTypeOther;
        }
/*
 //            if (_offsetType == OffsetTypeOther) {
 //
 //            }else{
 //                scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentSize.height-scrollView.frame.size.height);
 //            }
 */
        if (_tableView1.offsetType == OffsetTypeMax && _selectedIndex == 0) {

            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentSize.height-scrollView.frame.size.height);
        }
        
        if (_tableView2.offsetType == OffsetTypeMax && _selectedIndex == 1) {
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, scrollView.contentSize.height-scrollView.frame.size.height);
        }
        
    }else{
        
        if (scrollView.contentOffset.x<SCREEN_WIDTH) {
            [_sectionView updateItemWithIndex:0];
            _selectedIndex = 0;
        }else{
            [_sectionView updateItemWithIndex:1];
            _selectedIndex = 1;
        }
    }
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 400;
    } else {
        return kHeightDetailCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return kHeightSectionHeader;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    
    if (!_sectionView) {
        _sectionView = [[[NSBundle mainBundle] loadNibNamed:@"MoreItemView" owner:self options:nil] lastObject];
    }
    __weak ViewController *ws = self;
    [_sectionView setClickItemBtn:^(NSInteger index) {
        [ws.containerView setContentOffset:CGPointMake(index*SCREEN_WIDTH, 0) animated:YES];
        ws.selectedIndex = index;
    }];
    return _sectionView;
}


#pragma mark - httpRequest

#pragma mark - click

#pragma mark - private method

#pragma mark - setter

#pragma mark - init
- (void)initUI{
    [self.view addSubview:self.tableView];
    _selectedIndex = 0;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

@end
