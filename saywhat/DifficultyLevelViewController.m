//
//  ViewController.m
//  saywhat
//
//  Created by Edmund Mai on 8/2/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import "DifficultyLevelViewController.h"
#import "PlayerProfileViewController.h"
#import "GameManager.h"

@interface DifficultyLevelViewController ()

@end

@implementation DifficultyLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setDifficultyLevel:(id)sender {
    UIButton *button = (UIButton *)sender;

    NSString *difficultyLevel = [[button titleLabel] text];
    
    // Make API call here to grab 5 questions of that difficulty level
    NSArray *questions = @[@"What is your favorite animal?",
                           @"What is cooler than school?"];
    
    GameManager *gameManager = [GameManager sharedInstance];
    gameManager.difficultyLevel = difficultyLevel;
    gameManager.questions = questions;
}

@end
