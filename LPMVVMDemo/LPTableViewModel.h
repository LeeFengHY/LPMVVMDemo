//
//  LPTableViewModel.h
//  LPMVVMDemo
//
//  Created by QFWangLP on 15/12/22.
//  Copyright © 2015年 QFWang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^handleTableViewDateSource)(id model, NSIndexPath *indexPath,UITableViewCell *cell);
typedef CGFloat(^handleTableViewCellHeight)(NSIndexPath *indexPath,id model);
typedef void(^handleDidSelectWithRow)(NSIndexPath *indexPath, id model);

@interface LPTableViewModel : NSObject<UITableViewDataSource,UITableViewDelegate>

- (id)initWithDataArray:(NSArray *)dataArray
         cellIdentifire:(NSString *)cellIndetifire
        dataSourceBlock:(handleTableViewDateSource)dateSourceBlock
        cellHeightBlock:(handleTableViewCellHeight)cellHeightBlock
       didSelectWithRow:(handleDidSelectWithRow)didSelectBlock;

- (void)handleDateSourceAndDelegateWithTableView:(UITableView *)tableView;

- (id)modelAtIndexPath:(NSIndexPath *)indexPath;

@end
