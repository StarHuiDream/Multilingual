//
//  STLanguageTool.h
//  Multilingual
//
//  Created by StarHui on 2017/12/7.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * _Nonnull const languageFileKey;

#define STLANG(key) NSLocalizedStringFromTableInBundle(key, @"Localizable", [STLanguageTool localizedBundle], nil)

static NSString * _Nonnull ChineseHant = @"zh-Hant";
static NSString * _Nonnull ChineseHans = @"zh-Hans";
static NSString * _Nonnull English     = @"en";
// 语言发生变化的通知
static NSString * _Nonnull LangChangeNotification = @"LangChangeNotification";;

@interface STLanguageTool : NSObject

+ (NSBundle *_Nonnull)localizedBundle;

+ (NSString *_Nonnull)fetchLangFileName;

/**
 * 保存用户选择的语言
 * langFileName 语言名称
 */
+ (void)saveUserLocalLang:(NSString *_Nonnull)langFileName;

@end
