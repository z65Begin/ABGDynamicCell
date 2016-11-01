//
//  ABGFrameModel.h
//  ABGDynamicCell
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 AresBegin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ABGModel.h"

@interface ABGFrameModel : NSObject

@property (nonatomic, assign, readonly)  CGRect iconF;
@property (nonatomic, assign, readonly) CGRect  nameF;
@property (nonatomic, assign, readonly) CGRect textF;
@property (nonatomic, assign, readonly) CGRect pictureF;

@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, strong) ABGModel * cellModel;

@end
