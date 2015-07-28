//
//  CBGlobalCredentials.m
//  CareerBuilder Job Search
//
//  Created by Adam Parker on 12/13/12.
//  Copyright (c) 2012 CareerBuilder. All rights reserved.
//

#import "CBGlobalCredentials.h"

@implementation CBGlobalCredentials

// careerbuilder users can obtain an API dev_key by going to "http://http://api.careerbuilder.com/RequestDevKey.aspx"
@synthesize developerKey;
@synthesize siteID;
@synthesize cobrandCode;

// we need a developer key to be valid.  If the key is null or not the designed 20 characters
- (BOOL) valid {
    BOOL valid = FALSE;
    if(developerKey && developerKey.length == 20)
    {
        valid = TRUE;
    }
    return valid;
}


// return a singleton of the global credentials for the application to use
+ (CBGlobalCredentials *)globalInstance {
    // the instance of this class is stored here
    static CBGlobalCredentials *myInstance = nil;
    
    // check to see if an instance already exists
    if (nil == myInstance) {
        myInstance  = [[[self class] alloc] init];
        // initialize variables here
    }
    // return the instance of this class
    return myInstance;
}

@end
