//
//  CBAPIError.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBAPIError.h"

@implementation CBAPIError

@synthesize errorMessage;

- (id) initWithJSONDict:(NSDictionary *)jsonDict
{
    self = [super init];
    
    if(self)
    {
        self.errorMessage = jsonDict[@"Error"];
    }
    
    return self;
}

@end
