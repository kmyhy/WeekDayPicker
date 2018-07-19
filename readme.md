# 单周选择控件

任意从某个时间往前倒推 7 天中选择的某一天。比如从今天是 7 号，那么这个控件允许你选择 从 7 号到 1 号之间的某一天。
## demo 效果

<img src="1.png" width="300"/>

## 用法

```
DayInWeekPicker* picker = [[DayInWeekPicker alloc]initWithFrame:CGRectMake(6,0,SCREEN_WIDTH-12, DayInWeekPicker.preferedHeight)];
    
picker.date = [NSDate date];
picker.dateChangedHandler = ^(NSDate* date){
	NSDateFormatter *df = [NSDateFormatter new];
	df.dateFormat = @"yyyy-MM-dd";
	NSLog(@"%@",[df stringFromDate:date]);
};
[self.view addSubview:picker];
```

