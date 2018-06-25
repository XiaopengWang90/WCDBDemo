//
//  Message.h
//  WCDBDemo
//
//  Created by apple on 2018/6/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property(nonatomic, retain) NSString *content;
@property(nonatomic, assign) NSInteger localID;
@property(nonatomic, strong) NSDate *createTime;
@property(nonatomic, strong) NSDate *modifiedTime;
@property(nonatomic, strong) NSString *name;
@end
