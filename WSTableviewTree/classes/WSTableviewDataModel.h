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

@end
