# LPMVVMDemo
`通过绑定model和cell简单的体验MVVM框架,实际还是基于MVC上处理,只是分化了模块,对于复杂的,低耦合的模块建议使用MVVM,一般的我还是喜欢用MVC`
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
