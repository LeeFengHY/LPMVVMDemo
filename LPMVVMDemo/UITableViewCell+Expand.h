//
//  UITableViewCell+Expand.h
//  LPMVVMDemo
//
//  Created by QFWangLP on 15/12/22.
//  Copyright © 2015年 QFWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Expand)

/**
 *  注册cell
 *
 *  @param table
 *  @param identifier
 */
+ (void)registerTable:(UITableView *)table
        nibIdentifier:(NSString *)identifier;

/**
 *  cell 和model 绑定
 *
 *  @param cell
 *  @param obj           model
 *  @param indexPath
 */
- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath;
/**
 *  获取高度
 *
 *  @param obj
 *  @param indexPath
 *
 *  @return
 */
+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath;
@end
