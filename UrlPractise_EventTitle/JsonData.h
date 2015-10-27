//
//  JsonData.h
//  UrlPractise_EventTitle
//
//  Created by GuoRui on 10/27/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonData : NSObject <NSCoding>
/*
"EndDate":"4\/24\/2014 12:00:00 AM",
"EndTime":"10:00pm",
"EventCategory":"business",
"EventCategoryID":9,
"EventCategoryName":null,
"EventDescription":"Sample description",
"EventId":"5616",
"EventLocation":"Bangalore",
"EventTitle":"First Birthday",
"OrganizerDescription":"SampleDescription",
"Photo":"NoImage",
"RSVP":false,
"RepeatEvent":"1",
"RequireMap":true,
"StartDate":"4\/24\/2014 12:00:00 AM",
"StartTime":"7:00pm",
"Venue":"Marthahalli%20Banglore",
"Videolink":"20140424_100240.png",
"Views":22
*/
@property NSString *eventTitle;
@property NSString *eventLocation;
@property NSString *details;
@end
