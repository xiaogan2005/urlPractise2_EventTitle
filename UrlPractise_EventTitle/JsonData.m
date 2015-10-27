//
//  JsonData.m
//  UrlPractise_EventTitle
//
//  Created by GuoRui on 10/27/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "JsonData.h"

@implementation JsonData
@synthesize eventLocation;
@synthesize eventTitle;
@synthesize details;
//decode
- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.eventLocation = [decoder decodeObjectForKey:@"eventLocation"];
        self.eventTitle = [decoder decodeObjectForKey:@"eventTitle"];
        self.details = [decoder decodeObjectForKey:@"details"];
    }
    return self;
}
//encode
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:eventLocation forKey:@"eventLocation"];
    [encoder encodeObject:eventTitle forKey:@"eventTitle"];
    [encoder encodeBool:details forKey:@"details"];
}

@end
