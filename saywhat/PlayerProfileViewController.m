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
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) Player *player;
@property (weak, nonatomic) GameManager *gameManager;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation PlayerProfileViewController

- (Player *)player {
    if (!_player) {
        _player = [[Player alloc] init];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.gameManager = [GameManager sharedInstance];
    
    if ([self.gameManager.players count] < 3) {
        self.startButton.hidden = YES;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.imageView.image = self.player.image;
    if (!self.player.image) {
        self.imageView.image = [UIImage imageNamed:@"default-profile-pic"];
        self.nextButton.hidden = YES;
    } else {
        self.nextButton.hidden = NO;
    }
}

- (IBAction)takePhotoTapped:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    [self presentViewController:picker animated:YES completion:NULL];
}


- (IBAction)nextButtonTapped:(id)sender {
    [self.gameManager.players addObject:self.player];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.player.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end