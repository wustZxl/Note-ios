//
//  NoteListViewController.m
//  Note
//
//  Created by xiaolzho on 2019/10/23.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import "NoteListViewController.h"
#import "NoteListCell.h"
#import "NoteInfoModel.h"
#import "UICommon.h"
#import "UICommonColor.h"
#import "UIColor+Addition.h"

@interface NoteListViewController ()

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *datasource;

@end

@implementation NoteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSArray *)datasource {
    if (!_datasource) {
        // json文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"NoteInfo.json" ofType:nil];
        
        // 加载json文件
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        // 将json数据转换为NSArray或者NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 将数组内的字典转换为模型
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            NoteInfoModel *model = [NoteInfoModel modelWithDict:dict];
            [mutableArray addObject:model];
        }
        
        _datasource = mutableArray;
    }
    
    return _datasource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _tableView.backgroundColor = ColorNoteListCellBackground;
    }
    return _tableView;
}

#pragma mark - ================= tableView datasouce & delegate ==================

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoteListCell *cell = [[NoteListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NoteListCellIdentifier];
    NoteInfoModel *noteInfo = self.datasource[indexPath.row];
    cell.noteTitle = noteInfo.noteTitle;
    cell.noteDate = noteInfo.noteDate;
    UIView *view = [[UIView alloc]init];
    UILabel *label = [[UILabel alloc]init];
    label.text = @"delete";
    view.backgroundColor = ColorNoteListCellBackground;
    cell.editingAccessoryView = label;
    return cell;
}

//- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}
//UIContextualAction

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
