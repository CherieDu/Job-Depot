//
//  CBTestimonial.m
//  CareerBuilder
//
//  Created by Adam Parker on 3/5/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import "CBTestimonial.h"

@implementation CBTestimonial

@synthesize employeePhoto;
@synthesize name;
@synthesize title;
@synthesize since;
@synthesize content;

- (id) initWithJSONDict:(NSDictionary *)jsonDict {
    self = [super init];
    
    if(self && jsonDict) {
        self.employeePhoto = jsonDict[@"EmployeePhoto"];
        self.name = jsonDict[@"Name"];
        self.title = jsonDict[@"Title"];
        self.since = [NSNumber numberWithInteger:[jsonDict[@"Since"] integerValue]];
        self.content = jsonDict[@"Content"];
    }
    
    return self;
}

@end
