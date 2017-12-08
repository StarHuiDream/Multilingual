//
//  TodayViewController.m
//  STWidget
//
//  Created by StarHui on 2017/12/7.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "STLanguageTool.h"

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注意这里要根据自己的需求来处理，如果想让widget 语言与app 保持一致的话，需要将用户每次操作选择的语言保存到appGroup 这样，widget 才能访问，
    // 我这里的处理是让widget 的语言和手机系统的保持一致。
    self.textLabel.text = STSYSLANG(@"生如夏花之绚烂,死如秋叶之静美");
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
