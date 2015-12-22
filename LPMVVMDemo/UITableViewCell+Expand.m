//
//  UITableViewCell+Expand.m
//  LPMVVMDemo
//
//  Created by QFWangLP on 15/12/22.
//  Copyright © 2015年 QFWang. All rights reserved.
//

#import "UITableViewCell+Expand.h"

@implementation UITableViewCell (Expand)

#pragma mark --public
+ (void)registerTable:(UITableView *)tableView
        nibIdentifier:(NSString *)identifier
{
    [tableView registerNib:[UINib nibWithNibName:identifier bundle:nil] forCellReuseIdentifier:identifier];
}

/**
 *  绑定cell和model
 *
 *  @param cell      <#cell description#>
 *  @param obj       <#obj description#>
 *  @param indexPath <#indexPath description#>
 */
- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
{
    //模型赋值 coding here
}

/**
 *  获取cell高度
 *
 *  @param obj       <#obj description#>
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath
{
    if (!obj) {
        return 0.0f;
    }
    return 44.0f;
}
@end
