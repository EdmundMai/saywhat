//
//  Player.m
//  saywhat
//
//  Created by Edmund Mai on 8/14/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Player ()

@end

@implementation Player

@synthesize name, answers;

- (id)init {
    if (self = [super init]) {
        self.answers = [[NSMutableArray alloc] init];
    }
    return self;
}

@end