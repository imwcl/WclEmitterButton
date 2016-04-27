//
//  ViewController.m
//  WclEmitterButton
//
//  Created by 王崇磊 on 16/4/26.
//  Copyright © 2016年 王崇磊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)wclButtonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
