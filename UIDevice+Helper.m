//
//  UIDevice+Helper.m
//  
//
//  Created by Admin on 2017/12/27.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "UIDevice+Helper.h"
#import <sys/utsname.h>

@implementation UIDevice (Helper)

-(NSString *)iphoneType
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    // iPhone
    if([platform isEqualToString:@"iPhone1,1"]) return iPhone2G;
    if([platform isEqualToString:@"iPhone1,2"]) return iPhone3G;
    if([platform isEqualToString:@"iPhone2,1"]) return iPhone3GS;
    if([platform isEqualToString:@"iPhone3,1"]) return iPhone4;
    if([platform isEqualToString:@"iPhone3,2"]) return iPhone4;
    if([platform isEqualToString:@"iPhone3,3"]) return iPhone4;
    if([platform isEqualToString:@"iPhone4,1"]) return iPhone4s;
    if([platform isEqualToString:@"iPhone5,1"]) return iPhone5;
    if([platform isEqualToString:@"iPhone5,2"]) return iPhone5;
    if([platform isEqualToString:@"iPhone5,3"]) return iPhone5c;
    if([platform isEqualToString:@"iPhone5,4"]) return iPhone5c;
    if([platform isEqualToString:@"iPhone6,1"]) return iPhone5s;
    if([platform isEqualToString:@"iPhone6,2"]) return iPhone5s;
    if([platform isEqualToString:@"iPhone7,1"]) return iPhone6;
    if([platform isEqualToString:@"iPhone7,2"]) return iPhone6p;
    if([platform isEqualToString:@"iPhone8,1"]) return iPhone6s;
    if([platform isEqualToString:@"iPhone8,2"]) return iPhone6sp;
    if([platform isEqualToString:@"iPhone8,4"]) return iPhoneSE;
    if([platform isEqualToString:@"iPhone9,1"]) return iPhone7;
    if([platform isEqualToString:@"iPhone9,3"]) return iPhone7;
    if([platform isEqualToString:@"iPhone9,2"]) return iPhone7p;
    if([platform isEqualToString:@"iPhone9,4"]) return iPhone7p;
    if([platform isEqualToString:@"iPhone10,1"]) return iPhone8;
    if([platform isEqualToString:@"iPhone10,4"]) return iPhone8;
    if([platform isEqualToString:@"iPhone10,2"]) return iPhone8p;
    if([platform isEqualToString:@"iPhone10,5"]) return iPhone8p;
    if([platform isEqualToString:@"iPhone10,3"]) return iPhoneX;
    if([platform isEqualToString:@"iPhone10,6"]) return iPhoneX;
    if([platform isEqualToString:@"iPhone11,2"]) return iPhoneXs;
    if([platform isEqualToString:@"iPhone11,4"]) return iPhoneXsMax;
    if([platform isEqualToString:@"iPhone11,6"]) return iPhoneXsMax;
    if([platform isEqualToString:@"iPhone11,8"]) return iPhoneXr;
    if([platform isEqualToString:@"iPhone12,1"]) return iPhone11;
    if([platform isEqualToString:@"iPhone12,3"]) return iPhone11p;
    if([platform isEqualToString:@"iPhone12,5"]) return iPhone11pMax;
    // iPod
    if([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if([platform isEqualToString:@"iPod7,1"]) return @"iPod Touch 6G";
    if([platform isEqualToString:@"iPod9,1"]) return @"iPod Touch 7G";
    // iPad
    if([platform isEqualToString:@"iPad1,1"]) return @"iPad";
    if([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if([platform isEqualToString:@"iPad6,11"]) return @"iPad 5";
    if([platform isEqualToString:@"iPad6,12"]) return @"iPad 5";
    if([platform isEqualToString:@"iPad7,5"]) return @"iPad 6";
    if([platform isEqualToString:@"iPad7,6"]) return @"iPad 6";
    if([platform isEqualToString:@"iPad7,11"]) return @"iPad 7";
    if([platform isEqualToString:@"iPad7,12"]) return @"iPad 7";
    if([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if([platform isEqualToString:@"iPad11,3"]) return @"iPad Air 3";
    if([platform isEqualToString:@"iPad11,4"]) return @"iPad Air 3";
    // iPad mini
    if([platform isEqualToString:@"iPad2,5"]) return @"iPad mini";
    if([platform isEqualToString:@"iPad2,6"]) return @"iPad mini";
    if([platform isEqualToString:@"iPad2,7"]) return @"iPad mini";
    if([platform isEqualToString:@"iPad4,4"]) return @"iPad mini 2";
    if([platform isEqualToString:@"iPad4,5"]) return @"iPad mini 2";
    if([platform isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
    if([platform isEqualToString:@"iPad4,7"]) return @"iPad mini 3";
    if([platform isEqualToString:@"iPad4,8"]) return @"iPad mini 3";
    if([platform isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
    if([platform isEqualToString:@"iPad5,1"]) return @"iPad mini 4";
    if([platform isEqualToString:@"iPad5,2"]) return @"iPad mini 4";
    if([platform isEqualToString:@"iPad11,1"]) return @"iPad mini 5";
    if([platform isEqualToString:@"iPad11,2"]) return @"iPad mini 5";
    // iPad Pro 9.7
    if([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro (9.7-inch)";
    if([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro (9.7-inch)";
    // iPad Pro 10.5
    if([platform isEqualToString:@"iPad7,3"]) return @"iPad Pro (10.5-inch)";
    if([platform isEqualToString:@"iPad7,4"]) return @"iPad Pro (10.5-inch)";
    // iPad Pro 11.0
    if([platform isEqualToString:@"iPad8,1"]) return @"iPad Pro (11.0-inch)";
    if([platform isEqualToString:@"iPad8,2"]) return @"iPad Pro (11.0-inch)";
    if([platform isEqualToString:@"iPad8,3"]) return @"iPad Pro (11.0-inch)";
    if([platform isEqualToString:@"iPad8,4"]) return @"iPad Pro (11.0-inch)";
    // iPad Pro 12.9
    if([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro (12.9-inch)";
    if([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro (12.9-inch)";
    if([platform isEqualToString:@"iPad7,1"]) return @"iPad Pro (12.9-inch, 2nd generation)";
    if([platform isEqualToString:@"iPad7,2"]) return @"iPad Pro (12.9-inch, 2nd generation)";
    if([platform isEqualToString:@"iPad8,5"]) return @"iPad Pro (12.9-inch, 3rd generation)";
    if([platform isEqualToString:@"iPad8,6"]) return @"iPad Pro (12.9-inch, 3rd generation)";
    if([platform isEqualToString:@"iPad8,7"]) return @"iPad Pro (12.9-inch, 3rd generation)";
    if([platform isEqualToString:@"iPad8,8"]) return @"iPad Pro (12.9-inch, 3rd generation)";
    
    // Apple TV
    if([platform isEqualToString:@"AppleTV2,1"]) return @"Apple TV (2nd generation)";
    if([platform isEqualToString:@"AppleTV3,1"]) return @"Apple TV (3rd generation)";
    if([platform isEqualToString:@"AppleTV3,2"]) return @"Apple TV (3rd generation)";
    if([platform isEqualToString:@"AppleTV5,3"]) return @"Apple TV (4th generation)";
    if([platform isEqualToString:@"AppleTV6,2"]) return @"Apple TV 4K";
    // Apple Watch
    if([platform isEqualToString:@"Watch1,1"]) return @"Apple Watch";
    if([platform isEqualToString:@"Watch1,2"]) return @"Apple Watch";
    if([platform isEqualToString:@"Watch2,6"]) return @"Apple Watch Series 1";
    if([platform isEqualToString:@"Watch2,7"]) return @"Apple Watch Series 1";
    if([platform isEqualToString:@"Watch2,3"]) return @"Apple Watch Series 2";
    if([platform isEqualToString:@"Watch2,4"]) return @"Apple Watch Series 2";
    if([platform isEqualToString:@"Watch3,1"]) return @"Apple Watch Series 3";
    if([platform isEqualToString:@"Watch3,2"]) return @"Apple Watch Series 3";
    if([platform isEqualToString:@"Watch3,3"]) return @"Apple Watch Series 3";
    if([platform isEqualToString:@"Watch3,4"]) return @"Apple Watch Series 3";
    if([platform isEqualToString:@"Watch4,1"]) return @"Apple Watch Series 4";
    if([platform isEqualToString:@"Watch4,2"]) return @"Apple Watch Series 4";
    if([platform isEqualToString:@"Watch4,3"]) return @"Apple Watch Series 4";
    if([platform isEqualToString:@"Watch4,4"]) return @"Apple Watch Series 4";
    if([platform isEqualToString:@"Watch5,1"]) return @"Apple Watch Series 5";
    if([platform isEqualToString:@"Watch5,2"]) return @"Apple Watch Series 5";
    if([platform isEqualToString:@"Watch5,3"]) return @"Apple Watch Series 5";
    if([platform isEqualToString:@"Watch5,4"]) return @"Apple Watch Series 5";
    
    if([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    if([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
}

+(BOOL)isiPad {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([[platform substringToIndex:4] isEqualToString:@"iPad"]) {
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isiPhone {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([[platform substringToIndex:6] isEqualToString:@"iPhone"]) {
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isiPod {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([[platform substringToIndex:4] isEqualToString:@"iPod"]) {
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isAppleTV {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([[platform substringToIndex:7] isEqualToString:@"AppleTV"]) {
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isAppleWatch {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([[platform substringToIndex:5] isEqualToString:@"Watch"]) {
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isSimulator {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"i386"] || [[self devicePlatform] isEqualToString:@"x86_64"]) {
        return YES;
    } else {
        return NO;
    }
}

@end
