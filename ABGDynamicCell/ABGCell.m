//
//  ABGCell.m
//  ABGDynamicCell
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 AresBegin. All rights reserved.
//

#import "ABGCell.h"

#import "ABGFrameModel.h"
#import "ABGModel.h"
#import "UIImageView+WebCache.h"

#define ABGNameFont [UIFont systemFontOfSize:14.0f]
#define ABGTextFont [UIFont systemFontOfSize:15.0f]

#define W_SCREEN [UIScreen mainScreen].bounds.size.width

#define kImageUrl @"http://119.10.29.85:11118/walkerbuy/resource/shopResource/img/426/product/3751/"

@interface ABGCell ()

@property (nonatomic, strong) UIImageView * iconView;
@property (nonatomic, strong) UILabel * nameView;
@property (nonatomic, strong) UILabel * textView;
@property (nonatomic, strong) UIImageView * pictureView;

@end

@implementation ABGCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconView];
        
        self.nameView = [[UILabel alloc] init];
        self.nameView.font = ABGNameFont;
        [self.contentView addSubview:self.nameView];
        
        self.textView = [[UILabel alloc] init];
        self.textView.font = ABGTextFont;
        self.textView.numberOfLines = 0;
        [self.contentView addSubview:self.textView];
        
        self.pictureView = [[UIImageView alloc] init];
        self.pictureView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.pictureView];
    }
    return self;
}

- (void)showCellWithModel:(ABGFrameModel *)frameModel indexPath:(NSIndexPath *)indexPath{
    _modelFrame = frameModel;
    
    [self settingData:indexPath];
    [self settingFrame];
    
}

+ (instancetype)cellOfTableView:(UITableView *)tableView{
    static NSString * identifier = @"ABGCellIdentifier";
    ABGCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier ];
    if (!cell) {
        cell = [[ABGCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }else{
        for (UIView * view in cell.contentView.subviews) {
            if ([view isKindOfClass:[UIImageView class]]) {
                UIImageView * imageV = (UIImageView *)view;
                imageV.image = nil;
            }
            if ([view isKindOfClass:[UILabel class]]) {
                UILabel * label = (UILabel *)view;
                label.text = nil;
            }
        }
    }
    return cell;
}


- (void)settingData:(NSIndexPath *)tager{
    ABGModel * model = self.modelFrame.cellModel;
    self.iconView.image = [UIImage imageNamed:model.icon];
    self.nameView.text = model.name;
    self.textView.text = model.text;
    if (model.picture) {
        self.pictureView.hidden = NO;
        
        NSString * imageUrl = [NSString stringWithFormat:@"%@%@",kImageUrl,model.picture];
//   [self.pictureView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"3461756566.jepg"]  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//       NSLog(@"%@ %@",image,imageUrl);
        self.pictureView.image = [UIImage imageNamed:model.picture];
       if ([model.picH isEqualToString:@"44"]) {
           NSLog(@"model.picture->%@\t",model.picture);
           NSDictionary * userInfo = @{@"Height":@(self.pictureView.image.size.height * 0.5),@"indexPath":tager};
           [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectionViewController" object:nil userInfo:userInfo];
       }else{
           self.pictureView.hidden = YES;
       }
//   }];
    }

}

- (void)settingFrame{
    self.iconView.frame = self.modelFrame.iconF;
    self.nameView.frame = self.modelFrame.nameF;
    self.textView.frame = self.modelFrame.textF;
    if (self.modelFrame.cellModel.picture) {
        self.pictureView.hidden = NO;
        self.pictureView.frame = self.modelFrame.pictureF;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
