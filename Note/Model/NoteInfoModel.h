//
//  NoteInfoModel.h
//  Note
//
//  Created by xiaolzho on 2019/10/24.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteInfoModel : NSObject

@property (nonatomic, copy) NSString *noteTitle;
@property (nonatomic, copy) NSString *noteType;
@property (nonatomic, copy) NSString *noteDate;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
