//
//  DetailViewController.h
//  note
//
//  Created by 李龙跃 on 2017/3/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewControllerDelegate <NSObject>

//- (void)changView:(NSString *)str;

@end

@interface DetailViewController : UIViewController

@property (nonatomic,strong)UITextView *textView;

@property (nonatomic,assign)NSInteger number;
//@property (nonatomic,assign)id<DetailViewControllerDelegate> delegate;
//- (void)receiveTextView:(NSString *)text;

@end
