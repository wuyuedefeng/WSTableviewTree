//
//  ViewController.m
//  WSTableView
//
//  Created by Sakkaras on 26/12/13.
//  Copyright (c) 2013 Sakkaras. All rights reserved.
//

#import "ViewController.h"
#import "WSTableviewTree.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *contents;

@property (nonatomic, strong)NSMutableArray *dataSourceArrM;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.WSTableViewDelegate = self;
    
    // In order to expand just one cell at a time. If you set this value YES, when you expand an cell, the already-expanded cell is collapsed automatically.
//    self.tableView.shouldExpandOnlyOneCell = YES;
    
    self.navigationItem.title = @"WSTableView";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"全部收缩起来"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(collapseSubrows)];
//    [self setDataManipulationButton:UIBarButtonSystemItemRefresh];
    
    
    _dataSourceArrM = [NSMutableArray array];
    
    WSTableviewDataModel *dataModel = [[WSTableviewDataModel alloc] init];
    dataModel.firstLevelStr = @"医院选择";
    dataModel.shouldExpandSubRows = NO;
    [dataModel object_add_toSecondLevelArrM:@"医院1"];
    [dataModel object_add_toSecondLevelArrM:@"医院2"];
    [dataModel object_add_toSecondLevelArrM:@"医院3"];
    [dataModel object_add_toSecondLevelArrM:@"医院4"];
    [_dataSourceArrM addObject:dataModel];
    
    WSTableviewDataModel *dataModel2 = [[WSTableviewDataModel alloc] init];
    dataModel2.firstLevelStr = @"部位选择";
    dataModel2.shouldExpandSubRows = YES;
    [dataModel2 object_add_toSecondLevelArrM:@"腿"];
    [dataModel2 object_add_toSecondLevelArrM:@"脚"];
    [dataModel2 object_add_toSecondLevelArrM:@"头"];
    [dataModel2 object_add_toSecondLevelArrM:@"手"];
    [_dataSourceArrM addObject:dataModel2];
    
    
    WSTableviewDataModel *dataModel3 = [[WSTableviewDataModel alloc] init];
    dataModel3.firstLevelStr = @"部位选择2";
    [dataModel3 object_add_toSecondLevelArrM:@"腿2"];
    [dataModel3 object_add_toSecondLevelArrM:@"脚2"];
    [dataModel3 object_add_toSecondLevelArrM:@"头2"];
    [dataModel3 object_add_toSecondLevelArrM:@"手2"];
    dataModel3.expandable = NO;
    [_dataSourceArrM addObject:dataModel3];
    
    WSTableviewDataModel *dataModel4 = [[WSTableviewDataModel alloc] init];
    dataModel4.firstLevelStr = @"部位选择3";
    [_dataSourceArrM addObject:dataModel4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSourceArrM count];
    
}

- (NSInteger)tableView:(WSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath
{
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.row];
    return [dataModel.secondLevelArrM count];
}

- (BOOL)tableView:(WSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath
{
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.row];
    return dataModel.shouldExpandSubRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.row];
    static NSString *CellIdentifier = @"WSTableViewCell";
    
    WSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[WSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = dataModel.firstLevelStr;
    
    cell.expandable = dataModel.expandable;

    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.row];
    static NSString *CellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = [dataModel object_get_fromSecondLevelArrMWithIndex:indexPath.subRow];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(WSTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.row];
    dataModel.shouldExpandSubRows = !dataModel.shouldExpandSubRows;
    
    NSLog(@"Section: %d, Row:%d", indexPath.section, indexPath.row);
    
}

- (void)tableView:(WSTableView *)tableView didSelectSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Section: %d, Row:%d, Subrow:%d", indexPath.section, indexPath.row, indexPath.subRow);
}

#pragma mark - Actions

- (void)collapseSubrows
{
    [self.tableView collapseCurrentlyExpandedIndexPaths];
}

//- (void)refreshData
//{
//    NSArray *array = @[
//                       @[
//                           @[@"Section0_Row0", @"Row0_Subrow1",@"Row0_Subrow2"],
//                           @[@"Section0_Row1", @"Row1_Subrow1", @"Row1_Subrow2", @"Row1_Subrow3", @"Row1_Subrow4", @"Row1_Subrow5", @"Row1_Subrow6", @"Row1_Subrow7", @"Row1_Subrow8", @"Row1_Subrow9", @"Row1_Subrow10", @"Row1_Subrow11", @"Row1_Subrow12"],
//                           @[@"Section0_Row2"]
//                        ]
//                     ];
//    [self reloadTableViewWithData:array];
//    
//    [self setDataManipulationButton:UIBarButtonSystemItemUndo];
//}

//- (void)undoData
//{
//    [self reloadTableViewWithData:nil];
//    
//    [self setDataManipulationButton:UIBarButtonSystemItemRefresh];
//}

//- (void)reloadTableViewWithData:(NSArray *)array
//{
//    self.contents = array;
//    
//    // Refresh data not scrolling
////    [self.tableView refreshData];
//    
//    [self.tableView refreshDataWithScrollingToIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
//}

#pragma mark - Helpers
//
//- (void)setDataManipulationButton:(UIBarButtonSystemItem)item
//{
//    switch (item) {
//        case UIBarButtonSystemItemUndo:
//            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
//                                                                                                  target:self
//                                                                                                  action:@selector(undoData)];
//            break;
//            
//        default:
//            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
//                                                                                                  target:self
//                                                                                                  action:@selector(refreshData)];
//            break;
//    }
//}

@end
