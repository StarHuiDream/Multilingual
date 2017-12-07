//
//  SecondViewController.m
//  Multilingual
//
//  Created by StarHui on 2017/12/7.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "SecondViewController.h"
#import "STLanguageTool.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textLabel.text = STLANG(@"生如夏花之绚烂,死如秋叶之静美");
}

@end
