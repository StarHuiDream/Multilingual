//
//  ViewController.m
//  Multilingual
//
//  Created by StarHui on 2017/12/6.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "STLanguageTool.h"

@interface ViewController ()<CLLocationManagerDelegate>
    
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seamentControl;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startLocation];
    self.title = STLANG(@"第一个页面");
}

- (IBAction)langChangeOnClick:(UISegmentedControl *)sender {
    
    NSUInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0:
            [STLanguageTool saveUserLocalLang:@"zh-Hans"];
            break;
        case 1:
            [STLanguageTool saveUserLocalLang:@"zh-Hant"];
            break;
        case 2:
            [STLanguageTool saveUserLocalLang:@"en"];
            break;
        default:
            [STLanguageTool saveUserLocalLang:@"zh-Hans"];
            break;
    }
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = locations.lastObject;
    NSLog(@"当前位置信息:%@",newLocation);
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - private
-(void)startLocation{
    
    if ([CLLocationManager locationServicesEnabled]) {
        if (self.locationManager == nil) {
            self.locationManager = [[CLLocationManager alloc] init];
        }
        self.locationManager.delegate = self;
        [self.locationManager requestWhenInUseAuthorization];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        NSLog(@"定位了");
    } else {
        NSLog(@"没定位");
    }
    [self.locationManager startUpdatingLocation];
}
@end
