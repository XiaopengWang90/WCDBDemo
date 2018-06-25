//
//  ViewController.m
//  WCDBDemo
//
//  Created by apple on 2018/6/20.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "MessageManager.h"
#import "WCDBHeader.h"
#define TABLE_NAME @"message"  //数据表名
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark  ---- click event -----

//创建数据库
- (IBAction)createDBClickEvent:(id)sender {
    [[WCDBManager defaultManager] createDB];
}
//创建数据表
- (IBAction)createDBTableClickEvent:(id)sender {
    [[DBTableManager defaultManager]createTable:TABLE_NAME_MESSAGE cls:Message.class];
}


/**
 插入数据
 注意：isAutoIncrement 必须设置为YES 主键才会自增
 @param sender sender description
 */
- (IBAction)insertDataClickEvent:(id)sender {
    Message *message = [[Message alloc]init];
    message.content = @"---=--0";
    message.name = @"wxp";
    message.createTime = [NSDate date];
    message.modifiedTime = [NSDate date];
    message.isAutoIncrement = YES;
    [[MessageManager defaultManager]insertData:message];

}

//查询数据
- (IBAction)searchDataClickEvent:(id)sender {
    [[MessageManager defaultManager] getAllData];
}
//更新数据
- (IBAction)updataClickEvent:(id)sender {
    Message *message = [[Message alloc]init];
    message.content = @"---=--0";
    message.name = @"wxp";
    message.createTime = [NSDate date];
    message.modifiedTime = [NSDate date];
    [[MessageManager defaultManager] updateDataToDB:message];
}
//删除数据
- (IBAction)deleteDataClickEvent:(id)sender {
    [[MessageManager defaultManager] deleteDataWithLocalId:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
