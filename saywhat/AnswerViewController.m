//
//  AnswerViewController.m
//  saywhat
//
//  Created by Edmund Mai on 8/14/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import "AnswerViewController.h"
#import "GameManager.h"
#import "Player.h"

@interface AnswerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) GameManager *gameManager;
@property (weak, nonatomic) IBOutlet UIButton *showAnswerButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionButton;
@property (weak, nonatomic) IBOutlet UIButton *finishGameButton;

@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answerLabel.hidden = YES;
    self.timerLabel.text = @"5";
    self.timerLabel.hidden = YES;
    self.nextQuestionButton.hidden = YES;
    self.finishGameButton.hidden = YES;
    
    self.gameManager = [GameManager sharedInstance];
    
    if (!self.questionCount) {
        self.questionCount = 0;
    }
    
    NSString *currentQuestion = [self.gameManager.questions objectAtIndex:self.questionCount];
    self.questionLabel.text = currentQuestion;
}

- (void)showNavigationButtons {
    if (self.questionCount < [self.gameManager.questions count] - 1) {
        self.nextQuestionButton.hidden = NO;
    } else {
        self.finishGameButton.hidden = NO;
    }
}

- (void)updateTimerLabel {
    int countdownTime = [self.timerLabel.text intValue];
    if (countdownTime == 1) {
        self.timerLabel.text = @"Time!";
        [self.timer invalidate];
        self.timer = nil;
        [self showNavigationButtons];
    } else {
        countdownTime--;
        self.timerLabel.text = [NSString stringWithFormat:@"%i", countdownTime];
    }
}

- (IBAction)showAnswerButtonTapped:(id)sender {
//    NSLog(@"Current questionCount: %i", self.questionCount);
    self.showAnswerButton.hidden = YES;
    self.timerLabel.hidden = NO;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerLabel) userInfo:nil repeats:YES];
    
    NSMutableArray *players = self.gameManager.players;
    Player *randomPlayer = [players objectAtIndex: arc4random() % [players count]];
//    NSLog(@"Player answers: %@", randomPlayer.answers);
    NSString *answer = [randomPlayer.answers objectAtIndex:self.questionCount];
    self.answerLabel.text = answer;
    self.answerLabel.hidden = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NextQuestion"]) {
        AnswerViewController *avc = segue.destinationViewController;
        avc.questionCount = self.questionCount + 1;
    }
}

@end