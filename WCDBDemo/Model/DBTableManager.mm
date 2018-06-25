//
//  DBTableManager.m
//  WCDBDemo
//
//  Created by apple on 2018/6/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DBTableManager.h"

@implementation DBTableManager

#pragma mark ===== 单例初始化 ======
+ (DBTableManager *)defaultManager {
    static DBTableManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DBTableManager alloc]init];
    });
    return manager;
}

#pragma mark ======= 创建数据表 =======
- (void)createTable:(NSString *)tableName cls:(Class<WCTTableCoding>)cls {
    WCTDatabase *db = [[WCDBManager defaultManager]createDB];
    BOOL result = [db createTableAndIndexesOfName:tableName withClass:cls];
    if (result) {
        NSLog(@"创建表成功");
    }else {
        NSLog(@"创建表失败");
    }
}
@end
