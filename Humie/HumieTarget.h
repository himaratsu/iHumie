//
//  HumieTarger.h
//  Humie
//
//  Created by 平松 亮介 on 2013/03/23.
//  Copyright (c) 2013年 rhiramat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HumieTarget : NSObject

@property (nonatomic, strong) NSString *name;       // 名称(Steven Jobs)
@property (nonatomic, strong) NSString *fileName;   // ファイル名(jobs.jpg)
@property (nonatomic, strong) NSString *judge;      // 判定内容(Apple信者)

- (NSString*)getFileName;

@end
