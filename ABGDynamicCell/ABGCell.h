//
//  ABGCell.h
//  ABGDynamicCell
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 AresBegin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABGFrameModel;

@interface ABGCell : UITableViewCell

@property (nonatomic, strong) ABGFrameModel * modelFrame;
+ (instancetype)cellOfTableView:(UITableView *)tableView;
- (void)showCellWithModel:(ABGFrameModel *)frameModel indexPath:(NSIndexPath *)indexPath;
@end
