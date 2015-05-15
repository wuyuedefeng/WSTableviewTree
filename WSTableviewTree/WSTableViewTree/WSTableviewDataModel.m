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
        self.shouldExpandSubRows = NO;
        self.expandable = NO;
    }
    return self;
}
- (void)object_add_toSecondLevelArrM:(id)obj
{
    NSMutableDictionary *dicM = [[NSMutableDictionary alloc] initWithObjectsAndKeys:obj,kWSTableViewSecondLevelObj,@0,kWSTableViewScondLevelObjIsChecked, nil];
    [self set_noChecked_OfSecondLevelDicObject:dicM];
    [self.secondLevelArrM addObject:dicM];
    self.expandable = YES;
    
}
- (id)object_get_fromSecondLevelArrMWithIndex:(NSInteger)index
{
    if (!self.secondLevelArrM || self.secondLevelArrM.count == 0) {
        return nil;
    }
    return [self.secondLevelArrM[index] objectForKey:kWSTableViewSecondLevelObj];
}
- (void)set_Checked_OfSecondLevelDicObject:(NSMutableDictionary *)dicM
{
    [dicM setObject:@1 forKey:kWSTableViewScondLevelObjIsChecked];
}
- (void)set_noChecked_OfSecondLevelDicObject:(NSMutableDictionary *)dicM
{
    [dicM setObject:@0 forKey:kWSTableViewScondLevelObjIsChecked];
}

- (void)setCheckedSecondLevel:(BOOL)checked withSubRow:(NSInteger)subRow
{
    if (checked) {
        [self set_Checked_OfSecondLevelDicObject:self.secondLevelArrM[subRow]];
    }else{
        [self set_noChecked_OfSecondLevelDicObject:self.secondLevelArrM[subRow]];
    }
}
- (BOOL)isCheckedSubRow:(NSInteger)subRow
{
//    NSLog(@"========checked?  %d",[[self.secondLevelArrM[subRow] objectForKey:kWSTableViewScondLevelObjIsChecked] boolValue]);
    return [[self.secondLevelArrM[subRow] objectForKey:kWSTableViewScondLevelObjIsChecked] boolValue];
}
@end
