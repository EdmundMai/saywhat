//
//  GameManager.m
//  saywhat
//
//  Created by Edmund Mai on 8/14/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameManager.h"

@interface GameManager ()

@end

@implementation GameManager

+ (id)sharedInstance {
    static GameManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        self.players = [[NSMutableArray alloc] init];
    }
    return self;
}

@end