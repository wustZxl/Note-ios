//
//  ViewController.m
//  Note
//
//  Created by xiaolzho on 2019/10/21.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "ViewController.h"
#import "NoteHomeViewController.h"
#import "TodoListViewController.h"
#import "DoneListViewController.h"
#import "MeViewController.h"

#import <Masonry/Masonry.h>
#import "UICommon.h"

@interface ViewController ()

// noteList, toDoList, doneList, Me
@property (strong,nonatomic) UIViewController *noteListView;
@property (strong,nonatomic) TodoListViewController *toDoListView;
@property (strong,nonatomic) DoneListViewController *doneListView;
@property (strong,nonatomic) MeViewController *meView;

@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        UIView *iconBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        UIButton *iconButton = [[UIButton alloc]init];
        iconButton.frame = iconBackgroundView.frame;
//        iconButton. = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"settings"]];
        [iconButton setImage:[UIImage imageNamed:@"icon_settings"] forState:UIControlStateNormal];
        [iconButton addTarget:self action:@selector(iconButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [iconBackgroundView addSubview:iconButton];

        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:iconBackgroundView];

        self.navigationItem.title = @"Note List";
        self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];

        [self.view addSubview:self.tabBar];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"------view will appear-------");
}

- (void)viewDidLayoutSubviews {
    
}

#pragma mark - ================= selector ==================

- (void)iconButtonClick:(id)sender{
    
}

@end

