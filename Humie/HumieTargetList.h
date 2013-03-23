//
//  HumieTargerList.h
//  Humie
//
//  Created by 平松 亮介 on 2013/03/23.
//  Copyright (c) 2013年 rhiramat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HumieTargetList : NSObject

@property (nonatomic, strong) NSArray* humieTargetList;

+ (HumieTargetList*)sharedInstance;
- (NSInteger)count;
- (NSString*)fileNameAtIndex:(NSInteger)index;

@end
