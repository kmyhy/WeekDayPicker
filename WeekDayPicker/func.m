//
//  func.c
//  Client
//
//  Created by qq on 2016/12/5.
//  Copyright © 2016年 qq. All rights reserved.
//
#include "NSDate+DateTools.h"
#include "func.h"

BOOL stringIsWhiteChar(NSString* str){
    if(str == nil || str.length == 0)return YES;
    NSString *temp = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return [temp length]==0;
}

CGSize sizeForText(NSString* text, CGFloat fontSize,CGFloat widthLimited){
    if(stringIsWhiteChar(text)){
        return CGSizeZero;
    }
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName: textStyle};
    
    CGSize textSize = [text boundingRectWithSize: CGSizeMake(widthLimited, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes: textFontAttributes context: nil].size;
    
    return textSize;
}
NSString* weekdayChinese(NSDate* date){
    switch(date.weekday){
        case 1:
            return @"星期天";
        case 2:
            return @"星期一";
        case 3:
            return @"星期二";
        case 4:
            return @"星期三";
        case 5:
            return @"星期四";
        case 6:
            return @"星期五";
        default:
            return @"星期六";
            
    }
}
