//
//  ViewController.m
//  WeekDayPicker
//
//  Created by qq on 2018/7/19.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "DayInWeekPicker.h"
#import "dimensions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DayInWeekPicker* picker = [[DayInWeekPicker alloc]initWithFrame:CGRectMake(6,0,SCREEN_WIDTH-12, DayInWeekPicker.preferedHeight)];
    
    picker.date = [NSDate date];
    picker.dateChangedHandler = ^(NSDate* date){
        NSDateFormatter *df = [NSDateFormatter new];
        df.dateFormat = @"yyyy-MM-dd";
        NSLog(@"%@",[df stringFromDate:date]);
    };
    [self.view addSubview:picker];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
