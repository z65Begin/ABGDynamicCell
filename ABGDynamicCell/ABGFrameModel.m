//
//  ABGFrameModel.m
//  ABGDynamicCell
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 AresBegin. All rights reserved.
//

#import "ABGFrameModel.h"

#define ABGNameFont [UIFont systemFontOfSize:14.0f]
#define ABGTextFont [UIFont systemFontOfSize:15.0f]

@implementation ABGFrameModel

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize )maxSize{
    NSDictionary * attributes = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

- (void)setCellModel:(ABGModel *)cellModel{
    _cellModel = cellModel;
    
    CGFloat padding = 10 ;
    
    //icon
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconH = 30;
    CGFloat iconW = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //name
    CGSize nameSize = [self sizeWithText:self.cellModel.name font:ABGNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameX = CGRectGetMaxX(_iconF) + padding;
    CGFloat nameY = iconY + (CGRectGetHeight(_iconF) - nameSize.height) * 0.5;
    _nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    //text
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconF);
    CGSize textSize = [self sizeWithText:self.cellModel.text font:ABGTextFont maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 2*textX, MAXFLOAT)];
    _textF = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    //picture
    if (self.cellModel.picture) {
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(_textF) + padding;
        CGFloat pictureW = [self.cellModel.picW floatValue];
        CGFloat pictureH = [self.cellModel.picH floatValue];
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        _cellHeight = CGRectGetMaxY(_pictureF) + padding;
    }else{
        _cellHeight = CGRectGetMaxY(_textF) + padding;
    }
    
    
}


@end
