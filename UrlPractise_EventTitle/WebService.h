//
//  WebService.h
//  UrlPractise_EventTitle
//
//  Created by GuoRui on 10/27/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject
@property NSMutableArray *arr_objs;
-(void)webServiceCall:(NSString *)str;
-(void)webServiceCallUsingNSJSONSerialization:(NSString *)str;

@end
