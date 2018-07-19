//
//  DayInWeekPicker.h
//  WeekDayPicker
//
//  Created by qq on 2018/7/19.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Prefered_Height_DayInWeekPicker 100

@interface DayInWeekPicker : UIControl

@property(strong,nonatomic)NSDate* date;
@property(assign,nonatomic)NSInteger selIndex;
@property(copy,nonatomic)void(^dateChangedHandler)(NSDate* date);

+(CGFloat)preferedHeight;

@end
