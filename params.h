//
//  Header.h
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/17.
//  Copyright © 2016年 邓思琴. All rights reserved.
//



#ifndef Header_h
#define Header_h

#define KTabBarHeight 49
#define KNavigationBarHeight 64

#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define proportion_6 [UIScreen mainScreen].bounds.size.width/375
#define proportion_5 [UIScreen mainScreen].bounds.size.width/320
#define RGBColor(r,g,b)   [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define userDefaultsGet(key) [[NSUserDefaults standardUserDefaults]objectForKey:(key)]
#define userDefaultsSet(value,key) [[NSUserDefaults standardUserDefaults]setValue:(value) forKey:(key)]
#define KUserDefaults [NSUserDefaults standardUserDefaults]
#endif /* Header_h */