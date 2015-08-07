//
//  ViewController.m
//  saywhat
//
//  Created by Edmund Mai on 8/2/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import "ViewController.h"
#import "Session.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setDifficultyLevel:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSString *difficulty = [[button titleLabel] text];
    [Session setDifficultyLevel:difficulty];
}

@end
