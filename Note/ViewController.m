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
#import "NoteHomeTabBar.h"
#import "NoteHomeViewController.h"
#import "NoteListViewController.h"
#import "TodoListViewController.h"
#import "DoneListViewController.h"
#import "MeViewController.h"

#import <Masonry/Masonry.h>
#import "UICommon.h"
#import "UICommonColor.h"
#import "UIImage+Addition.h"

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
        // 利用KVO来使用自定义的tabBar
        [self setValue:[[NoteHomeTabBar alloc] init] forKey:@"tabBar"];
        self.tabBar.tintColor = HomeTabBarTintColor;
        [self addAllChildViewController];
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

- (void)addAllChildViewController {
    NoteListViewController *noteListVC = [[NoteListViewController alloc]init];
    noteListVC.view.backgroundColor = [UIColor orangeColor];
    [self addChildViewController:noteListVC withTitle:@"noteList" andImageName:@"tabbar_note"];
    
    TodoListViewController *todoListVC = [[TodoListViewController alloc]init];
    todoListVC.view.backgroundColor = [UIColor lightGrayColor];
    [self addChildViewController:todoListVC withTitle:@"todoList" andImageName:@"tabbar_todo"];
    
    NoteHomeViewController *homeVC = [[NoteHomeViewController alloc]init];
    homeVC.view.backgroundColor = [UIColor yellowColor];
    [self addChildViewController:homeVC withTitle:@"home" andImageName:@""];
    
    DoneListViewController *doneListVC = [[DoneListViewController alloc]init];
    doneListVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:doneListVC withTitle:@"doneList" andImageName:@"tabbar_done"];
    
    MeViewController *meVC = [[MeViewController alloc]init];
    meVC.view.backgroundColor = [UIColor systemPinkColor];
    [self addChildViewController:meVC withTitle:@"me" andImageName:@"tabbar_me"];
}

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title andImageName:(NSString *)imageName {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    childController.navigationItem.title = title;
    nav.tabBarItem.title = title;
    UIImage *image = [UIImage reSizeImage:[UIImage imageNamed:imageName] toSize:CGSizeMake(TABBAR_IMAGE_WIDTH, TABBAR_IMAGE_HEIGHT)];
    nav.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self addChildViewController:nav];
}

#pragma mark - ================= selector ==================

- (void)iconButtonClick:(id)sender{
    
}

@end

