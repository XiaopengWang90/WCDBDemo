//
//  Message.mm
//  WCDBDemo
//
//  Created by apple on 2018/6/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "Message+WCTTableCoding.h"
#import "Message.h"
#import <WCDB/WCDB.h>

@implementation Message

WCDB_IMPLEMENTATION(Message)
WCDB_SYNTHESIZE(Message, localID)
WCDB_SYNTHESIZE(Message, content)
WCDB_SYNTHESIZE(Message, createTime)
WCDB_SYNTHESIZE(Message, modifiedTime)
WCDB_SYNTHESIZE(Message, name)

WCDB_PRIMARY_ASC_AUTO_INCREMENT(Message, localID)
WCDB_UNIQUE(Message, localID)
WCDB_NOT_NULL(Message, localID)
WCDB_INDEX(Message, "_index", createTime)


/**
 打印描述

 @return 自定义类的内容
 */
-(NSString*)description{
    return [NSString stringWithFormat:@"<%@: %p> {localID: %ld ,content: %@ ,createTime: %@,modifiedTime: %@}",[self class],self,self.localID,self.content,self.createTime,self.modifiedTime];
}
@end
