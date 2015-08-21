//
//  PlayerProfileViewController.m
//  saywhat
//
//  Created by Edmund Mai on 8/12/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import "PlayerProfileViewController.h"
#import "GameManager.h"
#import "Player.h"

@interface PlayerProfileViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) GameManager *gameManager;

@end

@implementation PlayerProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.nameTextField.delegate = self;
    self.gameManager = [GameManager sharedInstance];
    
    if ([self.gameManager.players count] < 1) {
        self.startButton.hidden = YES;
    }
}

- (IBAction)nextButtonTapped:(id)sender {
    NSString *name = [self.nameTextField text];
    Player *newPlayer = [[Player alloc] init];
    newPlayer.name = name;
    [self.gameManager.players addObject:newPlayer];
}

#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end