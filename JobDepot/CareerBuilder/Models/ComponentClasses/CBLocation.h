//
//  CBLocation.h
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBLocation : NSObject

@property NSString *street1;
@property NSString *street2;
@property NSString *city;
@property NSString *state;
@property NSString *country;
@property NSString *postalCode;
@property NSString *metroCity;
@property float latitude; //JobDetails AND JobSearch
@property float longitude; //JobDetails AND JobSearch
@property NSString *locationFormatted; //JobDetails AND JobSearch
@property NSString *distanceSummary; //JobSearch only

- (id) initWithCompanyAddressJSONDict:(NSDictionary *)jsonDict;
- (NSString *) toHeadquartersString;

@end
