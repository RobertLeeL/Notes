//
//  ViewController.m
//  note
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "CreatNoteViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UILabel *noLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"备忘录";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;

    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressNew)];
    self.navigationItem.rightBarButtonItem = btn;
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    self.navigationItem.leftBarButtonItem = btn2;
//    [_tableView setEditing:YES];
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 84) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _dataArray = [[NSMutableArray alloc]init];
    _dataArray = [[NSUserDefaults standardUserDefaults]valueForKey:@"text"];
    
    

    [self.view addSubview:_noLabel];
    [self.view addSubview: _tableView];
}

- (void)pressNew {
    CreatNoteViewController *con = [[CreatNoteViewController alloc]init];
    
    [self.navigationController pushViewController:con animated:YES];

}



- (void)pressEdit {
    _tableView.editing = YES;
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressDone)];
    self.navigationItem.rightBarButtonItem = btn3;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [_dataArray removeObjectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults]setValue:(NSMutableArray *)_dataArray forKey:@"text"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
     _noLabel.text = [NSString stringWithFormat:@"%lu个备忘录",(unsigned long)_dataArray.count];
}


- (void)pressDone {
    _tableView.editing = NO;
   
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressNew)];
    self.navigationItem.rightBarButtonItem = btn;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)viewWillAppear:(BOOL)animated {
    _dataArray = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]valueForKey:@"text"]];

    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [_tableView reloadData];
    _noLabel.text = [NSString stringWithFormat:@"%lu个备忘录",(unsigned long)_dataArray.count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *con = [[DetailViewController alloc]init];
//    con.label.text = _dataArr
    con.number = indexPath.row ;
    
    [self.navigationController pushViewController:con animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
