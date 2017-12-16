//
//  SecondViewController.m
//  Multilingual
//
//  Created by StarHui on 2017/12/7.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "SecondViewController.h"
#import "STLanguageTool.h"
#import "MUTestCell.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = STLANG(@"第二个页面");
    self.textLabel.text = STLANG(@"生如夏花之绚烂,死如秋叶之静美");
}

#pragma mark -UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [MUTestCell instanceWith:tableView];
}

#pragma mark -UITableViewDelegate

@end
