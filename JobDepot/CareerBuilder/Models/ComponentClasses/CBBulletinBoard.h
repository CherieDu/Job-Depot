//
//  CBBulletinBoard.h
//  CareerBuilder
//
//  Created by Adam Parker on 3/5/13.
//  Copyright (c) 2013 CareerBuilder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBBulletinBoard : NSObject

@property NSString *title;
@property NSURL *URL;
@property NSString *description;
@property NSDate *createdDT;//6/18/2012

- (id) initWithJSONDict:(NSDictionary *)jsonDict;

@end
