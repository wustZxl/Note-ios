//
//  NoteListCell.m
//  Note
//
//  Created by xiaolzho on 2019/10/24.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import "NoteListCell.h"
#import <Masonry.h>
#import "UICommon.h"
#import "UICommonColor.h"
#import "UIColor+Addition.h"

@interface NoteListCell()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *leftSlideView;
@property (nonatomic, strong) UILabel *noteTitleLabel;
@property (nonatomic, strong) UILabel *noteDateLabel;

@end

@implementation NoteListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.editingAccessoryView = self.leftSlideView;
        self.backgroundColor = ColorNoteListCellBackground;
        [self addSubview:self.containerView];
        
        [self.containerView addSubview:self.noteTitleLabel];
        [self.containerView addSubview:self.noteDateLabel];
    }
    return self;
}

- (UIView *)contentView {
    if (!_containerView) {
        _containerView = [[UIView alloc]init];
        _containerView.backgroundColor = [UIColor whiteColor];
        _containerView.layer.cornerRadius = 5.0f;
    }
    return _containerView;
}

- (UILabel *)noteTitleLabel {
    if (!_noteTitleLabel) {
        _noteTitleLabel = [[UILabel alloc]init];
    }
    return _noteTitleLabel;
}

- (UILabel *)noteDateLabel {
    if (!_noteDateLabel) {
        _noteDateLabel = [[UILabel alloc]init];
    }
    return _noteDateLabel;
}

- (UIView *)leftSlideView {
    if (!_leftSlideView) {
        _leftSlideView = [[UIView alloc]init];
        _leftSlideView.backgroundColor = ColorNoteListCellBackground;
    }
    return _leftSlideView;
}

- (void)layoutSubviews {
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).with.offset(15.0);
        make.right.mas_equalTo(self.mas_right).with.offset(-15.0);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
    [self.noteTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containerView).offset(10);
        make.right.mas_equalTo(self.containerView).offset(-10);
        make.top.mas_equalTo(self.containerView).offset(10);
        make.height.mas_equalTo(20);
    }];
    self.noteTitleLabel.text = self.noteTitle;
    self.noteTitleLabel.font = [UIFont systemFontOfSize:16.0f];
            
    [self.noteDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.noteTitleLabel);
        make.right.mas_equalTo(self.noteTitleLabel);
        make.top.mas_equalTo(self.noteTitleLabel.mas_bottom).offset(10);
        make.bottom.mas_equalTo(self.containerView.mas_bottom).offset(-10);
    }];
    self.noteDateLabel.text = self.noteDate;
    self.noteDateLabel.font = [UIFont systemFontOfSize:12.0f];
    
    [self.leftSlideView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self).offset(-60);
//        make.right.mas_equalTo(self).offset(-10);
//        make.top.mas_equalTo(self).offset(10);
//        make.bottom.mas_equalTo(self).offset(-10);
        make.width.mas_equalTo(100);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
