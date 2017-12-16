//
//  MUTestCell.m
//  Multilingual
//
//  Created by StarHui on 2017/12/11.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "MUTestCell.h"
#import "STLanguageTool.h"

static NSString *MUTestCellCN = @"MUTestCellCN";
static NSString *MUTestCellEN = @"MUTestCellEN";

@implementation MUTestCell

+ (instancetype)instanceWith:(UITableView *)tableView{
    
    NSString *identifer = ([[STLanguageTool fetchLangFileName] isEqualToString:English]) ? MUTestCellEN : MUTestCellCN;
    MUTestCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    return cell;
}

@end
