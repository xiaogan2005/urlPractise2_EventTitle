//
//  WebService.m
//  UrlPractise_EventTitle
//
//  Created by GuoRui on 10/27/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "WebService.h"
#import "JsonData.h"
@implementation WebService
#pragma mark web service methods
-(void)webServiceCall:(NSString *)str{
    //same procecure
    _arr_objs=[NSMutableArray new];
    NSString *str_url=str;//@"http://183.82.48.194:8484/REM/RemService.svc/GetPublicEvent"
    NSURL *url=[NSURL URLWithString:str_url];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        //NSLog(@"the data is %@",data);
        //NSLog(@"the response is %@",response);
        // need to change the data into visible format ,or it just hex-number, use [ description]
        
        //id no pointer needed, cause id is pointer
        //error is same with error message, use &
        id object=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if(error){
            NSLog(@"there is error:%@",error);
            
        }else{
            // NSLog(@"the data is:%@",[object description]);
            if(object){
                //if object is not nil
                NSLog(@"call jsonObject mehtod");
                [self jsonObjectWithData:object];}
        }
        
    }];
    
    //data task should continue
    [dataTask resume];
}

-(void)webServiceCallUsingNSJSONSerialization:(NSString *)str{
    //same procecure
    _arr_objs=[NSMutableArray new];
    NSString *str_url=str;//@"http://183.82.48.194:8484/REM/RemService.svc/GetPublicEvent"
    NSURL *url=[NSURL URLWithString:str_url];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        //data is a array of dictionarys
        //This might give you a clear picture of how to handle it using NSJSONSerialization
        NSError *e = nil;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        
        if (!jsonArray) {
            NSLog(@"Error parsing JSON: %@", e);
        } else {
            for(NSDictionary *item in jsonArray) {
                [self jsonObjectWithData:item];
            }
        }

        
    }];
//    //
//    NSString *jsonString = @"[{\"id\": \"1\", \"name\":\"Aaa\"}, {\"id\": \"2\", \"name\":\"Bbb\"}]";
//    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *e = nil;
//    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&e];
//    NSLog(@"%@", json);
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
//    
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    //data task should continue
    [dataTask resume];
}


-(void)jsonObjectWithData:(id) object{
    // the object is actually a dictionary
    
    if([object isKindOfClass:[NSDictionary class]]){
        NSDictionary *dict_main=object;
        //NSLog(@"the main dict is%@",dict_main);
        NSArray *arr_result=[dict_main objectForKey:@"GetPublicEventResult"];
        //NSLog(@"the result is:%@",arr_result);
        
        for(int i=0;i<arr_result.count;i++){
            NSDictionary *dict_temp=arr_result[i];
            
            NSString *EventLocation=[dict_temp objectForKey:@"EventLocation"];
            
                      NSString *EventTitle=[dict_temp objectForKey:@"EventTitle"];
            NSMutableString *str=[NSMutableString new];
            JsonData  *obj=[[JsonData alloc]init];
            obj.eventTitle=EventTitle;
            obj.eventLocation =EventLocation;
            //block approach is much faster
            [dict_main enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
               // NSLog(@"%@ => %@", key, value);
                [str appendFormat:@"%@: %@\n",key,value];
            }];
            obj.details=str;
            
            
            [_arr_objs addObject:obj];
            
            
            
        }
        
        
        
    }
}

@end
