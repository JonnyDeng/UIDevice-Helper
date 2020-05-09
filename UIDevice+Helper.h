//
//  UIDevice+Helper.h
//  
//
//  Created by Admin on 2017/12/27.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *iPhone2G = @"iPhone 2G";
static NSString *iPhone3G = @"iPhone 3G";
static NSString *iPhone3GS = @"iPhone 3GS";
static NSString *iPhone4 = @"iPhone 4";
static NSString *iPhone4s = @"iPhone 4s";
static NSString *iPhone5 = @"iPhone 5";
static NSString *iPhone5c = @"iPhone 5c";
static NSString *iPhone5s = @"iPhone 5s";
static NSString *iPhone6 = @"iPhone 6";
static NSString *iPhone6p = @"iPhone 6 Plus";
static NSString *iPhone6s = @"iPhone 6s";
static NSString *iPhone6sp = @"iPhone 6s Plus";
static NSString *iPhoneSE = @"iPhone SE";
static NSString *iPhone7 = @"iPhone 7";
static NSString *iPhone7p = @"iPhone 7 Plus";
static NSString *iPhone8 = @"iPhone 8";
static NSString *iPhone8p = @"iPhone 8 Plus";
static NSString *iPhoneX = @"iPhone X";
static NSString *iPhoneXs = @"iPhone XS";
static NSString *iPhoneXsMax = @"iPhone XS Max";
static NSString *iPhoneXr = @"iPhone XR";
static NSString *iPhone11 = @"iPhone 11";
static NSString *iPhone11p = @"iPhone 11 Pro";
static NSString *iPhone11pMax = @"iPhone 11 Pro Max";

@interface UIDevice (Helper)

@property (nonatomic, readonly, strong) NSString *iphoneType;

@end
