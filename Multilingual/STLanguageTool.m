//
//  STLanguageTool.m
//  Multilingual
//
//  Created by StarHui on 2017/12/7.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STLanguageTool.h"

NSString * _Nonnull const languageFileKey = @"languageFileKey";

@implementation STLanguageTool

+ (NSBundle *_Nonnull)localizedBundle{
    
    NSString *langFileNameStr = [STLanguageTool fetchLangFileName];
    NSString *path            = [[NSBundle mainBundle] pathForResource:langFileNameStr ofType:@"lproj"];
    NSBundle *mBundle         = [NSBundle bundleWithPath:path];
    return mBundle;
}

+ (NSString *_Nonnull)fetchLangFileName{
    
    NSString *languageFileNameStr = [[NSUserDefaults standardUserDefaults] stringForKey:languageFileKey];
    // （1）这里根据自己的需求处理，
    // （2）我的的处理方式是：用户第一次使用app的时候，先获取用户系统的语言，如果用户手机的语言我们做了国际化，我们将用户的手机的当前语言设置成app的语言，如果用户手机系统的语言我们没有做相应的国际化处理，我直接将app的语言设置成英文，
    // （3）注意：用这种方式获取的用户语言后面会打个-US（像这样“zh-Hant-US”），但是语言包名后面没这个所以需要处理一下
    if (languageFileNameStr == nil || [languageFileNameStr isEqualToString:@""]) {
        
        NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        languageFileNameStr = [languages objectAtIndex:0];
        
        if ([languageFileNameStr containsString:ChineseHant]) {
            languageFileNameStr = ChineseHant;
        }else if ([languageFileNameStr containsString:ChineseHans]){
            languageFileNameStr = ChineseHans;
        }else{
            languageFileNameStr = English;
        }
        [STLanguageTool saveUserLocalLang:languageFileNameStr];
    }
    
    return languageFileNameStr;
}

+ (void)saveUserLocalLang:(NSString *_Nonnull)langFileName{

    [[NSUserDefaults standardUserDefaults] setObject:langFileName forKey:languageFileKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
     // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:LangChangeNotification object:nil];
}

@end
