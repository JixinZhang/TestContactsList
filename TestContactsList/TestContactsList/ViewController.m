//
//  ViewController.m
//  TestContactsList
//
//  Created by ZhangBob on 4/2/16.
//  Copyright © 2016 JixinZhang. All rights reserved.
//

#import "ViewController.h"
#import "UserTableViewCell.h"
#import "HeaderView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableView;
    NSArray *titleArray;
    
    NSArray *friendsArray;//好友列表
    NSArray *familyArray;//亲戚列表
    NSArray *schoolmateArray;//同学列表
    NSArray *friendstravelArray;//驴友列表
    NSArray *xianFriendsArray;//西安好友列表
    NSArray *strangersArray;//陌生人列表
    
    NSDictionary *dataDic;//第二层需要展示的数据
    
    NSMutableArray *selectedArray;//控制列表是否被打开
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 44)];
    navigationBar.backgroundColor = [UIColor clearColor];
    
    UINavigationItem *navigationBarTitle = [[UINavigationItem alloc] initWithTitle:@"联系人"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:nil];
    navigationBarTitle.rightBarButtonItem = addButton;
    
//    UIImage *headerImage = [UIImage imageNamed:@"fa.png"];
    UIBarButtonItem *headerImageButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fa.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    navigationBarTitle.leftBarButtonItem = headerImageButton;
    [navigationBar pushNavigationItem:navigationBarTitle animated:YES];
    

    
    [self.view addSubview:navigationBar];
    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 114)];
//    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
////    searchBar.layer.cornerRadius = 5.0;
////    searchBar.clipsToBounds = YES;
//    searchBar.placeholder = @"搜索";
//    searchBar.searchBarStyle = UISearchBarStyleMinimal;
//    [headerView addSubview:searchBar];
    
    HeaderView *headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 114)];
    
    [headerView.addFriendButton setBackgroundImage:[UIImage imageNamed:@"head_button_selected.png"] forState:UIControlStateHighlighted];
    [headerView.addFriendButton addTarget:self action:@selector(addFriendButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableHeaderView = headerView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
//    titleArray = [[NSArray alloc] initWithObjects:@"朋友",@"亲戚",@"同学",@"驴友",@"论坛好友",  nil];
    [self initDataSource];
    selectedArray = [[NSMutableArray alloc] init];
}

- (void)addFriendButtonClicked:(UIButton *)sender
{
    NSLog(@"点击新朋友");
}


-(void)initDataSource
{
    titleArray=[[NSArray alloc]initWithObjects:@"朋友",@"亲戚",@"同学",@"驴友",@"西安好友",@"陌生人", nil];
    
    NSDictionary *dic01=[[NSDictionary alloc]initWithObjectsAndKeys:@"张三丰",@"name",@"男",@"sex", nil];
    NSDictionary *dic02=[[NSDictionary alloc]initWithObjectsAndKeys:@"邓超",@"name",@"男",@"sex", nil];
    NSDictionary *dic03=[[NSDictionary alloc]initWithObjectsAndKeys:@"吴奇隆",@"name",@"男",@"sex", nil];
    
    friendsArray=[[NSArray alloc]initWithObjects:dic01,dic02,dic03, nil];
    
    NSDictionary *dic11=[[NSDictionary alloc]initWithObjectsAndKeys:@"爸爸",@"name",@"男",@"sex", nil];
    NSDictionary *dic12=[[NSDictionary alloc]initWithObjectsAndKeys:@"弟弟",@"name",@"男",@"sex", nil];
    NSDictionary *dic13=[[NSDictionary alloc]initWithObjectsAndKeys:@"三哥",@"name",@"男",@"sex", nil];
    NSDictionary *dic14=[[NSDictionary alloc]initWithObjectsAndKeys:@"大伯",@"name",@"男",@"sex", nil];
    NSDictionary *dic15=[[NSDictionary alloc]initWithObjectsAndKeys:@"二舅",@"name",@"男",@"sex", nil];
    
    familyArray=[[NSArray alloc]initWithObjects:dic11,dic12,dic13,dic14,dic15, nil];
    
    NSDictionary *dic21=[[NSDictionary alloc]initWithObjectsAndKeys:@"胖子",@"name",@"男",@"sex", nil];
    NSDictionary *dic22=[[NSDictionary alloc]initWithObjectsAndKeys:@"雄哥",@"name",@"男",@"sex", nil];
    NSDictionary *dic23=[[NSDictionary alloc]initWithObjectsAndKeys:@"小六子",@"name",@"男",@"sex", nil];
    
    schoolmateArray=[[NSArray alloc]initWithObjects:dic21,dic22,dic23, nil];
    
    
    NSDictionary *dic31=[[NSDictionary alloc]initWithObjectsAndKeys:@"三炮",@"name",@"男",@"sex", nil];
    NSDictionary *dic32=[[NSDictionary alloc]initWithObjectsAndKeys:@"郑海峰",@"name",@"男",@"sex", nil];
    NSDictionary *dic33=[[NSDictionary alloc]initWithObjectsAndKeys:@"王重阳",@"name",@"男",@"sex", nil];
    NSDictionary *dic34=[[NSDictionary alloc]initWithObjectsAndKeys:@"丘处机",@"name",@"男",@"sex", nil];
    NSDictionary *dic35=[[NSDictionary alloc]initWithObjectsAndKeys:@"吕娜",@"name",@"男",@"sex", nil ];
    NSDictionary *dic36=[[NSDictionary alloc]initWithObjectsAndKeys:@"郭金明",@"name",@"男",@"sex", nil];
    
    friendstravelArray=[[NSArray alloc]initWithObjects:dic31,dic32,dic33,dic34,dic35,dic36, nil];
    
    NSDictionary *dic41=[[NSDictionary alloc]initWithObjectsAndKeys:@"李晓峰",@"name",@"男",@"sex", nil];
    NSDictionary *dic42=[[NSDictionary alloc]initWithObjectsAndKeys:@"王蒙",@"name",@"男",@"sex", nil];
    NSDictionary *dic43=[[NSDictionary alloc]initWithObjectsAndKeys:@"李建",@"name",@"男",@"sex", nil];
    
    xianFriendsArray=[[NSArray alloc]initWithObjects:dic41,dic42,dic43, nil];
    
    NSDictionary *dic51=[[NSDictionary alloc]initWithObjectsAndKeys:@"胡雪",@"name",@"男",@"sex", nil];
    NSDictionary *dic52=[[NSDictionary alloc]initWithObjectsAndKeys:@"张小欢",@"name",@"男",@"sex", nil];
    NSDictionary *dic53=[[NSDictionary alloc]initWithObjectsAndKeys:@"刘丽丽",@"name",@"男",@"sex", nil];
    
    strangersArray=[[NSArray alloc]initWithObjects:dic51,dic52,dic53, nil];
    
    dataDic=[[NSDictionary alloc]initWithObjectsAndKeys:friendsArray,[titleArray objectAtIndex:0],familyArray,[titleArray objectAtIndex:1],schoolmateArray,[titleArray objectAtIndex:2],friendstravelArray,[titleArray objectAtIndex:3],xianFriendsArray,[titleArray objectAtIndex:4], strangersArray,[titleArray objectAtIndex:5], nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *string = [NSString stringWithFormat:@"%ld",section];
    if ([selectedArray containsObject:string]) {
        NSString *keyString = [titleArray objectAtIndex:section];
        NSArray *array = [dataDic objectForKey:keyString];
        return array.count;
    }else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 10.0;
    }else {
        return 0;
    }}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, self.view.frame.size.width, 30)];
    titleLabel.text = [titleArray objectAtIndex:section];
    [view addSubview:titleLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 15, 10, 10)];
    imageView.tag = 20000+section;
    NSString *string = [NSString stringWithFormat:@"%ld",section];
    if ([selectedArray containsObject:string]) {
        imageView.image = [UIImage imageNamed:@"arrow_down.png"];
    }else {
        imageView.image = [UIImage imageNamed:@"arrow_right.png"];
    }
    [view addSubview:imageView];
    
    UIButton *headerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    headerButton.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
    headerButton.tag = 10000+section;
    [headerButton addTarget:self
                     action:@selector(headerButtonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:headerButton];
    
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
        view.backgroundColor = [UIColor grayColor];
        return view;
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark - tableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *indexString = [NSString stringWithFormat:@"%ld",indexPath.section];
    
    NSString *keyString = [titleArray objectAtIndex:indexPath.section];
    
    NSArray *array = [dataDic objectForKey:keyString];
    
    static NSString *CellIdentifier = @"MainCell";
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = nil;
    if (cell == nil) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
//    UILabel *userLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, self.view.frame.size.width, 30)];
//    userLabel.text = [[array objectAtIndex:indexPath.row] objectForKey:@"name"];
//    [cell.contentView addSubview:userLabel];
    
//    NSDictionary *dic = [array objectAtIndex:indexPath.row];
//    cell.nameLabel.text = [dic valueForKey:@"name"];
//    cell.isOnLine.text = @"[在线]";
//    cell.introductionLabel.text = @"无动态";
//    cell.networkLabel.text = @"WiFi";
    
    if ([selectedArray containsObject:indexString]) {
        NSDictionary *dic = [array objectAtIndex:indexPath.row];
        cell.nameLabel.text = [dic valueForKey:@"name"];
        cell.isOnLine.text = @"[在线]";
        cell.introductionLabel.text = @"无动态";
        cell.networkLabel.text = @"WiFi";

    }
    
    return cell;
}

- (void)headerButtonClicked:(UIButton *)sender
{
    NSString *string = [NSString stringWithFormat:@"%ld",sender.tag-10000];
    
    if ([selectedArray containsObject:string]) {
        [selectedArray removeObject:string];
    }else {
        [selectedArray addObject:string];
    }
    
    [tableView reloadData];
}

@end
