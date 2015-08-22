//
//  PlayerProfileViewController.h
//  saywhat
//
//  Created by Edmund Mai on 8/12/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerProfileViewController : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@end