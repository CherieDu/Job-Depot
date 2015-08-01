//
//  CBLocation.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBLocation.h"

@implementation CBLocation

@synthesize street1;
@synthesize street2;
@synthesize city;
@synthesize state;
@synthesize country;
@synthesize postalCode;
@synthesize metroCity;
@synthesize latitude;
@synthesize longitude;
@synthesize locationFormatted;
@synthesize distanceSummary;


- (id) initWithCompanyAddressJSONDict:(NSDictionary *)jsonDict {
    self = [super init];
    
    if(self && jsonDict) {
        self.street1 = jsonDict[@"Street"];
        self.city = jsonDict[@"City"];
        self.State = jsonDict[@"State"];
        self.postalCode = jsonDict[@"ZIPCode"];
        self.country = jsonDict[@"Country"];
    }
                           
    return self;
}

- (NSString *) toHeadquartersString {
    return [NSString stringWithFormat:@"%@, %@", self.city, self.state];
}


@end
