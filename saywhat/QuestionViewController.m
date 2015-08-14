//
//  QuestionViewController.m
//  saywhat
//
//  Created by Edmund Mai on 8/14/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import "QuestionViewController.h"
#import "GameManager.h"
#import "Player.h"

@interface QuestionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;

@property (weak, nonatomic) GameManager *gameManager;
@property (weak, nonatomic) Player *currentPlayer;

@end

@implementation QuestionViewController

@synthesize questionCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.gameManager = [GameManager sharedInstance];
    self.currentPlayer = [self.gameManager.players lastObject];
    
    if (!self.questionCount) {
        self.questionCount = (NSUInteger)0;
    }
    
    if ([self.currentPlayer.answers count] < [self.gameManager.questions count] - 1) {
        self.nextButton.hidden = NO;
        self.finishButton.hidden = YES;
    } else {
        self.nextButton.hidden = YES;
        self.finishButton.hidden = NO;
    }
    
    NSString *currentQuestion = [self.gameManager.questions objectAtIndex:self.questionCount];
    self.questionLabel.text = currentQuestion;
}

- (IBAction)nextButtonTapped:(id)sender {
    NSString *answer = self.answerTextField.text;
    [self.currentPlayer.answers addObject:answer];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NewQuestion"]) {
        QuestionViewController *qvc = (QuestionViewController *)segue.destinationViewController;
        qvc.questionCount = self.questionCount + 1;
    }
}

@end