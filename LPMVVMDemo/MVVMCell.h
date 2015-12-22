//
//  MVVMCell.h
//  LPMVVMDemo
//
//  Created by QFWangLP on 15/12/22.
//  Copyright © 2015年 QFWang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MVVMCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

+ (NSString *)cellIdentifier;

@end
