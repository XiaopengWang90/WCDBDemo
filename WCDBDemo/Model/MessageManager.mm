//
//  MessageManager.m
//  WCDBDemo
//
//  Created by apple on 2018/6/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MessageManager.h"
#import "WCDBHeader.h"
@implementation MessageManager
+ (MessageManager *)defaultManager {
    static MessageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MessageManager alloc]init];
    });
    return manager;
}

#pragma mark ===== 插入数据库 =======
-(void)insertData:(Message *)message {
    BOOL result = [[WCDBManager defaultManager].dataBase insertObject:message into:TABLE_NAME_MESSAGE];
    if (result) {
        NSLog(@"插入成功");
    }else {
        NSLog(@"插入失败");
    }
}

#pragma mark ===== 查询数据库 ======

/**
 获取所有数据
 */
- (void)getAllData {
    NSArray<Message *> *messages = [[WCDBManager defaultManager].dataBase getAllObjectsOfClass:Message.class fromTable:TABLE_NAME_MESSAGE];
    NSLog(@"查询数据===%@",messages);
}

/**
 根据id 查找数据

 @param localId localId description
 */
- (void)getDataWithLocalId:(NSInteger)localId {
    NSArray<Message *> *messages = [[WCDBManager defaultManager].dataBase getObjectsOfClass:Message.class fromTable:TABLE_NAME_MESSAGE where:Message.localID == localId];
    NSLog(@"查询数据===%@",messages);
}

#pragma mark ===== 获取数据总数 ======
- (void)getDataCount {
    NSNumber *value = [[WCDBManager defaultManager].dataBase getOneValueOnResult:Message.AnyProperty.count() fromTable:TABLE_NAME_MESSAGE];
    NSLog(@"查询数据条数===%@",value);
}

#pragma mark ===== 更新数据 ======
- (void)updateDataToDB:(Message *)message {
    BOOL result = [[WCDBManager defaultManager].dataBase updateAllRowsInTable:TABLE_NAME_MESSAGE onProperties:Message.AllProperties withObject:message];
    if (result) {
        NSLog(@"修改成功");
    }else {
        NSLog(@"修改失败");
    }
}
#pragma mark ====== 删除数据 ======
- (void)deleteDataWithLocalId:(NSInteger)localID {
    BOOL result = [[WCDBManager defaultManager].dataBase deleteObjectsFromTable:TABLE_NAME_MESSAGE where:Message.localID == localID];
    if (result) {
        NSLog(@"删除成功");
    }else {
        NSLog(@"删除失败");
    }
}
@end
