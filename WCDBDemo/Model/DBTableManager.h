//
//  DBTableManager.h
//  WCDBDemo
//
//  Created by apple on 2018/6/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WCDBManager.h"
@interface DBTableManager : NSObject

+ (DBTableManager *)defaultManager;

- (void)createTable:(NSString *)tableName cls:(Class<WCTTableCoding>)cls;
@end
