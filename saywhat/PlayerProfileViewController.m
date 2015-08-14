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

@end

@implementation PlayerProfileViewController

- (GameManager *)gameManager {
    return [GameManager sharedInstance];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    if ([[self gameManager].players count] < 3) {
        self.startButton.hidden = YES;
    }
}

- (IBAction)nextButtonTapped:(id)sender {
    NSString *name = [self.nameTextField text];
    Player *newPlayer = [[Player alloc] init];
    newPlayer.name = name;
    [[self gameManager].players addObject:newPlayer];
}

@end