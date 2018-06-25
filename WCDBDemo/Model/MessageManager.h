//
//  MessageManager.h
//  WCDBDemo
//
//  Created by apple on 2018/6/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message+WCTTableCoding.h"
#import "DBTableManager.h"
@interface MessageManager : NSObject
+ (MessageManager *)defaultManager;
-(void)insertData:(Message *)message;
- (void)getAllData;
- (void)getDataWithLocalId:(NSInteger)localId;
- (void)getDataCount;
- (void)updateDataToDB:(Message *)message;
- (void)deleteDataWithLocalId:(NSInteger)localID;
@end
