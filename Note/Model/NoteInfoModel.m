//
//  NoteInfoModel.m
//  Note
//
//  Created by xiaolzho on 2019/10/24.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import "NoteInfoModel.h"

@implementation NoteInfoModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.noteTitle = dict[@"noteTitle"];
        self.noteDate = dict[@"noteDate"];
        self.noteType = dict[@"noteType"];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc]initWithDict:dict];
}

@end
