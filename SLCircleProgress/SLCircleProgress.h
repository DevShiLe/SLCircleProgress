//
//  SLCircleProgress.h
//  SLCircleProgress
//
//  Created by 石乐 on 16/8/2.
//  Copyright © 2016年 石乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLCircleProgress : UIView
@property (nonatomic, assign) int currentProgress;

//进度条底色
@property (nonatomic, retain) UIColor *circleColor;

//进度条更新颜色
@property (nonatomic, retain) UIColor *progresscircleColor;

//进度条宽度
@property (nonatomic, assign) CGFloat circleBorderWidth;

- (void)update:(int)progress;
@end
