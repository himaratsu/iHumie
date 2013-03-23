//
//  HumieTargerList.m
//  Humie
//
//  Created by 平松 亮介 on 2013/03/23.
//  Copyright (c) 2013年 rhiramat. All rights reserved.
//

#import "HumieTargetList.h"
#import "HumieTarget.h"

static HumieTargetList *sharedInstance = nil;

@implementation HumieTargetList

+ (HumieTargetList *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[HumieTargetList alloc] init];
    }
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        self.humieTargetList = [self loadHumieTargetList];
    }
    return self;
}

- (NSArray*)loadHumieTargetList {
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* path = [bundle pathForResource:@"HumieDefault" ofType:@"plist"];
    NSArray* humieDefaultList = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mutArray = [[NSMutableArray alloc] init];
    for (NSDictionary* humieElem in humieDefaultList) {
        HumieTarget *humie = [[HumieTarget alloc] init];
        humie.name      = [humieElem objectForKey:@"name"];
        humie.fileName  = [humieElem objectForKey:@"fileName"];
        humie.judge     = [humieElem objectForKey:@"judge"];
        [mutArray addObject:humie];
    }
    
    return [NSArray arrayWithArray:humieDefaultList];
}

- (NSInteger)count {
    return [_humieTargetList count];
}

- (NSString *)fileNameAtIndex:(NSInteger)index {
    HumieTarget *humie = [self.humieTargetList objectAtIndex:index];
    LOG (@"humie = %@", humie);
    
    return [humie getFileName];
//    return humie.fileName;
}


@end
