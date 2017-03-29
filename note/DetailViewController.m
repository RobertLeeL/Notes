//
//  DetailViewController.m
//  note
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"

@interface DetailViewController (){
//    UITextView *_text;
    NSString *str;
    NSMutableArray *_array;
}




@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"详细";
    
    _array = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]valueForKey:@"text"] ];
//    array =  [[NSUserDefaults standardUserDefaults]valueForKey:@"text"];
    str = _array[_number];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _textView.font = [UIFont systemFontOfSize:18];
    _textView.text = str;
    _textView.editable  = NO;
    [self.view addSubview:_textView];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEditable)];
    
    self.navigationItem.rightBarButtonItem = item ;
    // Do any additional setup after loading the view.
}


//- (void)receiveTextView:(NSString *)text {
//    _textView.text = text;
//    _textView.editable = NO;
//    
//    [self.view addSubview:_textView];
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pressEditable {
    _textView.editable = YES;
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressDone)];
    self.navigationItem.rightBarButtonItem = item2;
}

- (void)pressDone {
    if (_textView.text.length == 0) {
        [_array removeObjectAtIndex:_number];
        [[NSUserDefaults standardUserDefaults]setValue:_array forKey:@"text"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }else {
        [_array replaceObjectAtIndex:_number withObject:_textView.text];
        [[NSUserDefaults standardUserDefaults]setValue:_array forKey:@"text"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEditable)];
    
    self.navigationItem.rightBarButtonItem = item ;
    _textView.editable = NO;
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
