//
//  ViewController.m
//  UrlPractise_EventTitle
//
//  Created by GuoRui on 10/27/15.
//  Copyright © 2015 GuoRui. All rights reserved.
//

#import "ViewController.h"
#import "WebService.h"
#import "JsonData.h"
#import "TableViewController.h"

@interface ViewController ()

- (IBAction)click_bt_parse:(id)sender;
@property NSArray *arr_objs;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click_bt_parse:(id)sender {
   
    WebService *ws=[WebService new];
    NSString *str=@"http://183.82.48.194:8484/REM/RemService.svc/GetPublicEvent";
    [ws webServiceCall:str];
    //[ws webServiceCallUsingNSJSONSerialization:str]; not working
    _arr_objs=ws.arr_objs;
    NSLog([_arr_objs description]);//nil???
    
    //segue
    TableViewController *viewController=[TableViewController new];
    UIStoryboardSegue *segue_1=[UIStoryboardSegue segueWithIdentifier:@"gotoTableView" source:self destination:viewController performHandler:^(void){
        
        
        NSLog(@"going to tableview");
        
        viewController.arr_objs=_arr_objs;
    }];
    NSLog(@"end of bt_click");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"gotoTableView"]){
        TableViewController *viewController=[segue destinationViewController];
        
        NSLog(@"going to tableview");
        
        viewController.arr_objs=_arr_objs;
        
    }
}
@end
