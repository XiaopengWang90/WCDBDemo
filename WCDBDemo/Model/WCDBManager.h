//
//  WCDBManager.h
//  WCDBDemo
//
//  Created by apple on 2018/6/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>
@interface WCDBManager : NSObject
@property (nonatomic, strong) WCTDatabase *dataBase;

+ (WCDBManager *)defaultManager;

#pragma mark ====== 创建数据库 ======
- (WCTDatabase *)createDB;
@end
