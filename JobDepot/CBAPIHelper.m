//
//  CBAPIHelper.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBAPIHelper.h"

@implementation CBAPIHelper

+ (NSString *) URLEncodeString:(NSString *)inString {
    return [inString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}

@end
