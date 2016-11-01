//
//  ViewController.m
//  ABGDynamicCell
//
//  Created by Admin on 16/10/31.
//  Copyright © 2016年 AresBegin. All rights reserved.
//

#import "ViewController.h"

#import "ABGFrameModel.h"
#import "ABGModel.h"
#import "ABGCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self registNotifaction];
}

-(void)registNotifaction
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCell:) name:@"SelectionViewController" object:nil];
}

//刷新cell
- (void)reloadCell:(NSNotification *)info{
    NSDictionary * dict = info.userInfo;
    NSString * picHeight = [[dict objectForKey:@"Height"] stringValue];
    NSIndexPath * indexPath = [dict objectForKey:@"indexPath"];
    if (self.dataSource.count >= indexPath.row ) {
        ABGFrameModel * modelFrame = [self.dataSource objectAtIndex:indexPath.row];
        modelFrame.cellModel.picH = picHeight;
        modelFrame.cellModel = modelFrame.cellModel;
        [self.dataSource replaceObjectAtIndex:indexPath.row withObject:modelFrame];
//        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark getter

- (UITableView *)tableView{
    if (!_tableView) {
        CGRect frame = self.view.bounds;
        frame.origin.y += 20;
        frame.size.height -= 20;
        
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray * dicArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * arr = [NSMutableArray array];
        for (NSDictionary * dict  in dicArray) {
            ABGModel * model = [ABGModel modelWithDict:dict];
            ABGFrameModel * frameModel = [[ABGFrameModel alloc] init];
            frameModel.cellModel = model;
            [arr addObject:frameModel];
        }
        _dataSource = arr;
    }
    return _dataSource;
}

#pragma mark 实现数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ABGCell * cell = [ABGCell cellOfTableView:tableView];
    [cell showCellWithModel:self.dataSource[indexPath.row] indexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ABGFrameModel * modelFrame = self.dataSource[indexPath.row];
    return modelFrame.cellHeight;
}



@end
