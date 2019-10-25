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
        [self.containerView addSubview:self.noteTitleLabel];
        [self.containerView addSubview:self.noteDateLabel];
    }
    return self;
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
        _leftSlideView.backgroundColor = pink02;
    }
    return _leftSlideView;
}

- (void)layoutSubviews {
    self.noteTitleLabel.frame = CGRectMake(10, 10, self.bounds.size.width - 20, 30);
    self.noteTitleLabel.text = self.noteTitle;
    self.noteTitleLabel.font = [UIFont systemFontOfSize:16.0f];
            
    self.noteDateLabel.frame = CGRectMake(10, 40, self.bounds.size.width - 20, 20);
    self.noteDateLabel.text = self.noteDate;
    self.noteDateLabel.font = [UIFont systemFontOfSize:12.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
