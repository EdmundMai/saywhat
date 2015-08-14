//
//  Player.h
//  saywhat
//
//  Created by Edmund Mai on 8/14/15.
//  Copyright (c) 2015 Edmund Mai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *answers;

@end
