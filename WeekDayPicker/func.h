//
//  func.h
//  Client
//
//  Created by qq on 2016/12/5.
//  Copyright © 2016年 qq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


// 给定文字及字号求文字块大小
CGSize sizeForText(NSString* text, CGFloat fontSize,CGFloat widthLimited);
NSString* weekdayChinese(NSDate* date);
