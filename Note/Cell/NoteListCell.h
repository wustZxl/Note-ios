//
//  NoteListCell.h
//  Note
//
//  Created by xiaolzho on 2019/10/24.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteListCell : UITableViewCell

@property (nonatomic, strong) UIImageView   *noteImageView;
@property (nonatomic, copy) NSString       *noteTitle;
@property (nonatomic, copy) NSString       *noteDate;

@end

NS_ASSUME_NONNULL_END
