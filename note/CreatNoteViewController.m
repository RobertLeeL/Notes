//
//  CreatNoteViewController.m
//  note
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CreatNoteViewController.h"
#import "ViewController.h"

@interface CreatNoteViewController ()
{
    UITextView *_textView;
}

@end

@implementation CreatNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textView = [[ UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:_textView];

    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(pressOK)];
    self.navigationItem.rightBarButtonItem = item ;
    
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(pressCancel)];
//    [self.navigationItem setBackBarButtonItem:btn];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(pressCancel)];
    self.navigationItem.leftBarButtonItem = btn ;
}

- (void)pressOK {
    NSArray *array = [[NSUserDefaults standardUserDefaults]valueForKey:@"text"];
    if (!array) {
        array = [[NSArray alloc]init];
    }
    NSMutableArray *newArray = [[NSMutableArray alloc]initWithArray:array];
    if (_textView.text.length == 0) {
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        } ];
        [alert addAction:action];
        [self  presentViewController:alert animated:YES completion:nil];
    }else {
    [newArray addObject:_textView.text];
    [[NSUserDefaults standardUserDefaults]setValue:newArray forKey:@"text"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [_textView resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)pressCancel {
//    [self dismissViewControllerAnimated:YES completion:nil];

//    ViewController *view = [[ViewController alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
