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
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSegmentSelect];
    
    [self startLocation];
    
    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(langChange)
                                                 name:LangChangeNotification
                                               object:nil];
    [self langChange];
}

-(void)dealloc{
    
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)langChangeOnClick:(UISegmentedControl *)sender {
    
    NSUInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0:
            [STLanguageTool saveUserLocalLang:ChineseHans];
            break;
        case 1:
            [STLanguageTool saveUserLocalLang:ChineseHant];
            break;
        case 2:
            [STLanguageTool saveUserLocalLang:English];
            break;
        default:
            [STLanguageTool saveUserLocalLang:English];
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

-(void)langChange{
    self.title = STLANG(@"第一个页面");
    self.contentLabel.text = STLANG(@"生如夏花之绚烂,死如秋叶之静美");
    [self.nextBtn setTitle:STLANG(@"下一页") forState:UIControlStateNormal];
}

// 将当前语言对应的segment的条目选中
-(void)setupSegmentSelect{
    NSString *currentLang = [STLanguageTool fetchLangFileName];
    if ([currentLang isEqualToString:ChineseHans]) {
        [self.segmentControl setSelectedSegmentIndex:0];
    }else if ([currentLang isEqualToString:ChineseHant]){
        [self.segmentControl setSelectedSegmentIndex:1];
    }else{
        [self.segmentControl setSelectedSegmentIndex:2];
    }
}
@end
