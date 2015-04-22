//
//  WSTableviewDataModel.m
//  WSTableviewTree
//
//  Created by senwang on 15/4/22.
//  Copyright (c) 2015年 senwang. All rights reserved.
//

#import "WSTableviewDataModel.h"
#import "WSTableviewTree.h"
#define kWSTableViewScondLevelObjIsChecked @"isChecked"
@implementation WSTableviewDataModel

- (instancetype)init
{
    if (self = [super init]) {
        self.secondLevelArrM = [NSMutableArray array];
    }
    return self;
}
- (void)addObject_to_secondLevelArrM:(id)obj
{
    NSMutableDictionary *dicM = [[NSMutableDictionary alloc] initWithObjectsAndKeys:obj,kWSTableViewSecondLevelObj,@0,kWSTableViewScondLevelObjIsChecked, nil];
    [self.secondLevelArrM addObject:dicM];
}
- (void)set_Checked_OfSecondLevelDicObject:(NSMutableDictionary *)dicM
{
    [dicM setObject:@1 forKey:kWSTableViewScondLevelObjIsChecked];
}
- (void)set_noChecked_OfSecondLevelDicObject:(NSMutableDictionary *)dicM
{
    [dicM setObject:@0 forKey:kWSTableViewScondLevelObjIsChecked];
}
@end
