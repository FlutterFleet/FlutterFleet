//
//  jpush_flutter2-umbrella.h
//
//  Created by Ying Wang on 2023/12/08.
//
#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif
#import "JPushFlutterPlugin.h"

FOUNDATION_EXPORT double jpush_flutterVersionNumber;
FOUNDATION_EXPORT const unsigned char jpush_flutterVersionString[];
