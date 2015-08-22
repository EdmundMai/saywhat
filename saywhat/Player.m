//
//  Player.m
//  saywhat
//
//  Created by Edmund Mai on 8/14/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import "Player.h"

@interface Player ()

@end

@implementation Player

- (id)init {
    if (self = [super init]) {
        self.answers = [[NSMutableArray alloc] init];
    }
    return self;
}

@end