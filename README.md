# WSTableviewTree
##运行demo
![运行demo](https://github.com/wuyuedefeng/WSTableviewTree/blob/master/WSTableviewTree/demohere.gif)

***

###该框架可以自定义二级cell伸展，折叠，使用方法和原生方法基本一样  不需要任何学习成本
##### 该项目自定义拓展的tableview的代理方法
```objective-c
- (NSInteger)tableView:(WSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath；
- (CGFloat)tableView:(WSTableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath
- (BOOL)tableView:(WSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath
```

****

###注意
###### tableview的cell必须继承WSTableViewCell, subCell不能继承WSTableViewCell,WSTableViewCell中的expandable属性用于区别，cell属于一级cell还是二级cell！！

###用途简介
##比如
![写过的样式](https://github.com/wuyuedefeng/WSTableviewTree/blob/master/WSTableviewTree/can.gif)

##使用方法
######创建tableview数据源最好使用提供的WSTableviewDataModel（该model定义了一级标签所显示的字符串，和存放二级标签对象的数组，可以任意继承该类进行任意拓展）
    

    ```objective-c
    _dataSourceArrM = [NSMutableArray array];
    WSTableviewDataModel *dataModel = [[WSTableviewDataModel alloc] init];
    dataModel.firstLevelStr = @"医院选择";
    dataModel.shouldExpandSubRows = NO; //默认收缩数据（不设置默认为NO）
    [dataModel object_add_toSecondLevelArrM:@"医院1"];
    [dataModel object_add_toSecondLevelArrM:@"医院2"];
    [dataModel object_add_toSecondLevelArrM:@"医院3"];
    [dataModel object_add_toSecondLevelArrM:@"医院4"];
    [_dataSourceArrM addObject:dataModel];
    
    WSTableviewDataModel *dataModel2 = [[WSTableviewDataModel alloc] init];
    dataModel2.firstLevelStr = @"部位选择";
    dataModel2.shouldExpandSubRows = YES; //默认显示数据
    [dataModel2 object_add_toSecondLevelArrM:@"腿"];
    [dataModel2 object_add_toSecondLevelArrM:@"脚"];
    [_dataSourceArrM addObject:dataModel2];
    
    WSTableviewDataModel *dataModel3 = [[WSTableviewDataModel alloc] init];
    dataModel3.firstLevelStr = @"部位选择2";
    [dataModel3 object_add_toSecondLevelArrM:@"腿2"];
    dataModel3.expandable = NO; //不允许展开数据
    [_dataSourceArrM addObject:dataModel3];
    
    WSTableviewDataModel *dataModel4 = [[WSTableviewDataModel alloc] init];
    dataModel4.firstLevelStr = @"部位选择3";
    [_dataSourceArrM addObject:dataModel4];
    ```
    
    ###更多拓展tableview方法请查看WSTableView头文件
    
    

