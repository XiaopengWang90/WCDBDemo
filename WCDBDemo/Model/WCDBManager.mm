//
//  WCDBManager.m
//  WCDBDemo
//
//  Created by apple on 2018/6/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "WCDBManager.h"

#define DB_NAME @"/testDB"  //数据库名


@implementation WCDBManager

/**
 单例初始化 只初始化一次

 @return manager
 */
+ (WCDBManager *)defaultManager {
    static WCDBManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WCDBManager alloc]init];
    });
    return manager;
}

#pragma mark ====== 创建数据库 ======

- (WCTDatabase *)createDB {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingString:DB_NAME];
    _dataBase = [[WCTDatabase alloc] initWithPath:path];
    return _dataBase;
    
}

#pragma mark ===== lazyload ========
- (WCTDatabase *)dataBase {
    if (!_dataBase) {
        _dataBase = [self createDB];
    }
    return _dataBase;
}

@end

