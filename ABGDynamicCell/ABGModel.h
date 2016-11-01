//
//  ABGModel.h
//  ABGDynamicCell
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 AresBegin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABGModel : NSObject

@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * picture;
@property (nonatomic, assign) BOOL  vip;

@property (nonatomic, copy) NSString * picW;
@property (nonatomic, copy) NSString * picH;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
