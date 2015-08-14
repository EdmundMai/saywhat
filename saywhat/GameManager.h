//
//  GameManager.h
//  saywhat
//
//  Created by Edmund Mai on 8/14/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject

@property (nonatomic, strong) NSString *difficultyLevel;
@property (nonatomic, strong) NSMutableArray *players;
@property (nonatomic, strong) NSArray *questions;

+ (id)sharedInstance;
@end