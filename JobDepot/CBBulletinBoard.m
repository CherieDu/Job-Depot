//
//  CBBulletinBoard.m
//  CareerBuilder
//
//  Created by Adam Parker on 3/5/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import "CBBulletinBoard.h"

@implementation CBBulletinBoard

@synthesize title;
@synthesize URL;
@synthesize description;
@synthesize createdDT;

- (id) initWithJSONDict:(NSDictionary *)jsonDict {
    self = [super init];
    
    if(self && jsonDict) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"M/D/YYYY"];
        
        self.title = jsonDict[@"Title"];
        self.URL = jsonDict[@"URL"];
        self.description = jsonDict[@"Description"];
        self.createdDT = [dateFormatter dateFromString:jsonDict[@"CreatedDT"]];
    }
    
    return self;
}

@end
