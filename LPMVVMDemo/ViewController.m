//
//  ViewController.m
//  LPMVVMDemo
//
//  Created by QFWangLP on 15/12/22.
//  Copyright © 2015年 QFWang. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "MVVMCell.h"
#import "LPTableViewModel.h"
#import "UITableViewCell+Expand.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) LPTableViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupViewModel];
}

/**
 *  lazy load
 *
 *  @return
 */
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (NSInteger i = 0; i<20; i++) {
            CellModel *model = [[CellModel alloc] init];
            model.name = [NSString stringWithFormat:@"LeeFengHY MVVM Model%ld",(long)i];
            model.height = 50+ i*5;
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
    
}

/**
 *  VC实现view和viewModel的逻辑(View<->ViewModel<->Model)
 */
- (void)setupViewModel
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    handleTableViewDateSource dateSourceBlock = ^(id model, NSIndexPath *indexPath,UITableViewCell *cell){
        [cell configure:cell customObj:model indexPath:indexPath];
        
    };
    
    handleTableViewCellHeight cellHeighBlock = ^CGFloat (NSIndexPath *indexPath,id model){
        return [MVVMCell getCellHeightWithCustomObj:model indexPath:indexPath];
    };
    
    handleDidSelectWithRow didSelectBlock = ^(NSIndexPath *indexPath, id model){
    };
    
    _viewModel = [[LPTableViewModel alloc] initWithDataArray:self.dataArray cellIdentifire:[MVVMCell cellIdentifier] dataSourceBlock:dateSourceBlock cellHeightBlock:cellHeighBlock didSelectWithRow:didSelectBlock];
    [_viewModel handleDateSourceAndDelegateWithTableView:_tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
