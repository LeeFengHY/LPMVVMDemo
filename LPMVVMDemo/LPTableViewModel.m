//
//  LPTableViewModel.m
//  LPMVVMDemo
//
//  Created by QFWangLP on 15/12/22.
//  Copyright © 2015年 QFWang. All rights reserved.
//

#import "LPTableViewModel.h"
#import "UITableViewCell+Expand.h"

@interface LPTableViewModel ()

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, copy) NSString *cellIdentifier ;
@property (nonatomic, copy) handleTableViewDateSource dataSourceBlock;
@property (nonatomic, copy) handleDidSelectWithRow didSelectBlock;
@property (nonatomic, copy) handleTableViewCellHeight cellHeightBlock;

@end

@implementation LPTableViewModel

- (id)initWithDataArray:(NSArray *)dataArray
         cellIdentifire:(NSString *)cellIndetifire
        dataSourceBlock:(handleTableViewDateSource)dataSourceBlock
        cellHeightBlock:(handleTableViewCellHeight)cellHeightBlock
       didSelectWithRow:(handleDidSelectWithRow)didSelectBlock
{
    self = [super init];
    if (self) {
        _dataArray = dataArray;
        _dataSourceBlock = dataSourceBlock;
        _didSelectBlock = didSelectBlock;
        _cellHeightBlock = cellHeightBlock;
        _cellIdentifier = cellIndetifire;
    }
    return self;
}

/**
 *  设置数据源和代理
 *
 *  @param tableView
 */
- (void)handleDateSourceAndDelegateWithTableView:(UITableView *)tableView
{
    tableView.dataSource = self;
    tableView.delegate = self;
}

/**
 *  返回每个row 的model
 *
 *  @param indexPath
 *
 *  @return
 */
- (id)modelAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArray[indexPath.row];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self modelAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        [UITableViewCell registerTable:tableView nibIdentifier:self.cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    }
    if (_dataSourceBlock) {
        _dataSourceBlock(model,indexPath,cell);
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self modelAtIndexPath:indexPath];
    if (_didSelectBlock) {
        _didSelectBlock(indexPath,model);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = [self modelAtIndexPath:indexPath];
    return self.cellHeightBlock(indexPath,model);
}
@end
