//
//  MVVMCell.m
//  LPMVVMDemo
//
//  Created by QFWangLP on 15/12/22.
//  Copyright © 2015年 QFWang. All rights reserved.
//

#import "MVVMCell.h"
#import "CellModel.h"
#import "UITableViewCell+Expand.h"

@implementation MVVMCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)cellIdentifier
{
    return @"MVVMCell";
}

/**
 *  cell和model绑定
 *
 *  @param cell
 *  @param obj
 *  @param indexPath
 */
- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
{
    CellModel *myObj = (CellModel *)obj ;
    MVVMCell *mycell = (MVVMCell *)cell ;
    mycell.nameLabel.text = myObj.name;
    cell.backgroundColor = indexPath.row % 2 ? [UIColor redColor] : [UIColor purpleColor] ;
}

/**
 *  重写获取cell高度方法
 *
 *  @param obj
 *  @param indexPath
 *
 *  @return 
 */
+ (CGFloat)getCellHeightWithCustomObj:(id)obj indexPath:(NSIndexPath *)indexPath
{
    return ((CellModel *)obj).height;
}
@end
