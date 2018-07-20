//
//  StartTVC.m
//  SimplifiedCellHeaderFooterOCDemo
//
//  Created by mac on 2018/3/3.
//  Copyright © 2018年 chenbo. All rights reserved.
//

#import "StartTVC.h"
#import "UITableView+ReuseView.h"
#import "DemoCell1.h"
#import "DemoCell2.h"
#import "DemoHeaderFooterView1.h"
#import "DemoHeaderFooterView2.h"

@interface StartTVC ()

@end

@implementation StartTVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 70.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section % 2 == 0) {
        DemoCell1 * cell = [tableView cellWithClass:[DemoCell1 class] fileType:FileTypeNib];
        cell.lblTitle.text = @"DemoCell1";
        cell.lblSubTitle.text = [NSString stringWithFormat:@"%ld ==> %ld",indexPath.section, indexPath.row];
        return cell;
    } else {
        DemoCell2 * cell = [tableView cellWithClass:[DemoCell2 class] fileType:FileTypeNib];
        cell.lbl1.text = [NSString stringWithFormat:@"%ld ==> %ld",indexPath.section, indexPath.row];
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section % 2 == 0) {
        DemoHeaderFooterView1 * hf = [tableView headerFooterFromNib:[DemoHeaderFooterView1 class]];
        hf.lbl1.text = [NSString stringWithFormat:@"section: %ld",section];
        hf.lbl2.text = @"as: Header";
        hf.backgroundColor = UIColor.yellowColor;
        return hf;
    } else {
        DemoHeaderFooterView2 * hf = [tableView headerFooterFromNib:[DemoHeaderFooterView2 class]];
        hf.lbl1.text = [NSString stringWithFormat:@"section: %ld",section];
        hf.lbl2.text = @"as: Header";
        hf.backgroundColor = UIColor.blueColor;
        return hf;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section % 2 == 0) {
        DemoHeaderFooterView2 * hf = [tableView headerFooterFromNib:[DemoHeaderFooterView2 class]];
        hf.lbl1.text = [NSString stringWithFormat:@"section: %ld",section];
        hf.lbl2.text = @"as: Footer";
        hf.backgroundColor = UIColor.cyanColor;
        return hf;
    } else {
        DemoHeaderFooterView1 * hf = [tableView headerFooterFromNib:[DemoHeaderFooterView1 class]];
        hf.lbl1.text = [NSString stringWithFormat:@"section: %ld",section];
        hf.lbl2.text = @"as: Footer";
        hf.backgroundColor = UIColor.greenColor;
        return hf;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
