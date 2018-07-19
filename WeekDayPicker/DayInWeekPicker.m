//
//  DayInWeekPicker.m
//  WeekDayPicker
//
//  Created by qq on 2018/7/19.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "DayInWeekPicker.h"
#import "NSDate+DateTools.h"
#import "func.h"
#import "UIImage+Color.h"
#import "UIColor+Hex.h"
#import "colors.h"

@interface DayInWeekPicker(){
    
    __weak IBOutlet UILabel *label1;
    __weak IBOutlet UIButton *button1;
    __weak IBOutlet UILabel *label2;
    __weak IBOutlet UIButton *button2;
    __weak IBOutlet UILabel *label3;
    __weak IBOutlet UIButton *button3;
    __weak IBOutlet UILabel *label4;
    __weak IBOutlet UIButton *button4;
    __weak IBOutlet UILabel *label5;
    __weak IBOutlet UIButton *button5;
    __weak IBOutlet UILabel *label6;
    __weak IBOutlet UIButton *button6;
    __weak IBOutlet UILabel *label7;
    __weak IBOutlet UIButton *button7;
}
@property(strong,nonatomic)NSMutableArray<UILabel*> *labels;
@property(strong,nonatomic)NSMutableArray<UIButton*> *buttons;
@property(strong,nonatomic)NSMutableArray<NSDate*> *days;
@property(weak,nonatomic)IBOutlet UIView* view;
@end

@implementation DayInWeekPicker

// MAKR: - initializer
-(void)xibSetup{
    self.view = [self loadViewFromNib];
    
    // use bounds not frame or it'll be offset
    self.view.frame = self.bounds;
    
    // Make the view stretch with containing view
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:self.view];
    
    // 填充 labels/buttons 数组
    _labels = [NSMutableArray new];
    [self.labels addObject:label1];
    [self.labels addObject:label2];
    [self.labels addObject:label3];
    [self.labels addObject:label4];
    [self.labels addObject:label5];
    [self.labels addObject:label6];
    [self.labels addObject:label7];
    
    _buttons = [NSMutableArray new];
    [self.buttons addObject:button1];
    [self.buttons addObject:button2];
    [self.buttons addObject:button3];
    [self.buttons addObject:button4];
    [self.buttons addObject:button5];
    [self.buttons addObject:button6];
    [self.buttons addObject:button7];
    
    // 添加按钮样式
    for(int i=0;i<_buttons.count;i++){
        UIButton* btn = _buttons[i];
        [self configButtonSytle:btn];
        [self addButtonTarget:btn atIndex:i];
    }
    
    _selIndex = 6;
}

-(UIView*)loadViewFromNib{
    
    UINib* nib = [UINib nibWithNibName:@"DayInWeekPicker" bundle:nil];
    
    UIView *view = [nib instantiateWithOwner:self options:nil][0];
    
    return view;
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame: frame];
    [self xibSetup];
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    [self xibSetup];
    return self;
}
// MARK: - getter/setter
-(void)setDate:(NSDate *)date{
    _date = date;
    _days = [NSMutableArray new];
    if(date !=nil){
        for (int i= 6; i > 0; i--) {
            NSDate* day = [date dateBySubtractingDays:i];
            [_days addObject:day];
        }
        [_days addObject:date];
        _selIndex = 6;
        [self reloadData];
    }
}
-(void)setSelIndex:(NSInteger)selIndex{
    _selIndex = selIndex;
    if(selIndex >= 0 && selIndex < 7){
        [self reloadData];
    }
}
+(CGFloat)preferedHeight{
    return Prefered_Height_DayInWeekPicker;
}
// MARK: - private
-(void)configButtonSytle:(UIButton*)btn{
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:primaryBrandColor]] forState:UIControlStateSelected];
    [btn setBackgroundImage:nil forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn.layer.cornerRadius = 14;
    btn.layer.masksToBounds = YES;
}
-(void)addButtonTarget:(UIButton*)btn atIndex:(NSInteger)index{
    btn.tag = 100 + index;
    [btn addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)dateChanged:(UIButton*)sender{
    if(_selIndex != sender.tag-100){
        self.selIndex = sender.tag-100;
        if(self.dateChangedHandler){
            self.dateChangedHandler(_days[_selIndex]);
        }
    }
}
-(void)reloadData{
    for(int i=0;i<7;i++){
        NSDate* day = _days[i];
        UILabel* label = _labels[i];
        UIButton* button = _buttons[i];
        label.text = weekdayChinese(day);
        [button setTitle:[NSString stringWithFormat:@"%d月%d",(int)day.month,(int)day.day] forState:UIControlStateNormal];
        
        button.selected = i==_selIndex;
    }
}
@end
