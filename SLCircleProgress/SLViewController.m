//
//  SLViewController.m
//  SLCircleProgress
//
//  Created by 石乐 on 16/8/2.
//  Copyright © 2016年 石乐. All rights reserved.
//

#import "SLViewController.h"
#import "SLCircleProgress.h"
#define SLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SLColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define SLRandomColor SLColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
@interface SLViewController ()
@property (strong, nonatomic) SLCircleProgress *circleButton;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic,assign) float progress;
@end

@implementation SLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=SLColor(255, 255, 255);
    self.circleButton = [[SLCircleProgress alloc] initWithFrame:CGRectMake(70, 110, 180, 180)];
    [self.view  addSubview:self.circleButton];
    [self.circleButton update:0];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refreshProgressView:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)refreshProgressView:(NSTimer *)timer{
    _progress += 0.001;
    [self.circleButton update:_progress*10000];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
