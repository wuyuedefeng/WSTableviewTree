//
//  WSTableviewDataModel.h
//  WSTableviewTree
//
//  Created by senwang on 15/4/22.
//  Copyright (c) 2015年 senwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSTableviewDataModel : NSObject

@property (nonatomic,copy)NSString *firstLevelStr;
@property (nonatomic,strong)NSMutableArray *secondLevelArrM;

@property (nonatomic, assign)BOOL shouldExpandSubRows;

@property (nonatomic, assign)BOOL expandable;

- (void)object_add_toSecondLevelArrM:(id)obj;
- (id)object_get_fromSecondLevelArrMWithIndex:(NSInteger)index;

- (void)setCheckedSecondLevel:(BOOL)checked withSubRow:(NSInteger)subRow;
- (BOOL)isCheckedSubRow:(NSInteger)subRow;
@end
