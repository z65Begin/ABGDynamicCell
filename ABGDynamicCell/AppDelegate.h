//
//  AppDelegate.h
//  ABGDynamicCell
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 AresBegin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

