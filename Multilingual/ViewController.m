//
//  ViewController.m
//  Multilingual
//
//  Created by StarHui on 2017/12/6.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>
    
@property (strong, nonatomic) CLLocationManager *locationManager;
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startLocation];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    
    
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
    
    // 开始定位
    [self.locationManager startUpdatingLocation];
}
    
#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    
    CLLocation *newLocation = locations.lastObject;
    
    
    [self.locationManager stopUpdatingLocation];
    
    CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
    CLGeocodeCompletionHandler handle = ^(NSArray *placemarks, NSError *error)
    {
        
        
    };
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [clGeoCoder reverseGeocodeLocation:newLocation completionHandler:handle];
    
}


@end
