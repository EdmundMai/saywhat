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

@property (weak, nonatomic) GameManager *gameManager;

@end

@implementation DifficultyLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.gameManager = [GameManager sharedInstance];
    self.gameManager.players = [[NSMutableArray alloc] init];
}

- (IBAction)setDifficultyLevel:(id)sender {
    UIButton *button = (UIButton *)sender;

    NSString *difficultyLevel = [[button titleLabel] text];
    
    // Make API call here to grab 5 questions of that difficulty level
    NSArray *questions = @[@"What is your favorite animal?",
                           @"What is cooler than school?"];
    
    self.gameManager.difficultyLevel = difficultyLevel;
    self.gameManager.questions = questions;
}

@end
