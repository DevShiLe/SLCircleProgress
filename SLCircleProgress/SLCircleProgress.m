//
//  SLCircleProgress.m
//  SLCircleProgress
//
//  Created by 石乐 on 16/8/2.
//  Copyright © 2016年 石乐. All rights reserved.
//

#import "SLCircleProgress.h"
#define SLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define SLColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define SLRandomColor SLColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define kCircleSegs 10000

@implementation SLCircleProgress
@synthesize currentProgress;

@synthesize circleColor;
@synthesize circleBorderWidth;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circleColor = SLColor(241, 241, 241);
        self.progresscircleColor = SLColor(230, 60, 60);
        self.circleBorderWidth = 8;
        
        self.currentProgress = 0;
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)update:(int)progress {
    self.currentProgress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    float radius = CGRectGetWidth(rect)/2.0f - self.circleBorderWidth/2.0f;
    float angleOffset = M_PI_2;
    
    CGContextSetLineWidth(context, self.circleBorderWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextBeginPath(context);
    
    CGContextAddArc(context,CGRectGetMidX(rect), CGRectGetMidY(rect),radius,-angleOffset,self.currentProgress/(float)kCircleSegs*M_PI*2 - angleOffset,
                    1);
    
    CGContextSetStrokeColorWithColor(context, self.circleColor.CGColor);
    CGContextStrokePath(context);
    
    if (self.currentProgress != kCircleSegs) {
        CGContextAddArc(context,
                        CGRectGetMidX(rect), CGRectGetMidY(rect),
                        radius,
                        self.currentProgress/(float)kCircleSegs*M_PI*2 - angleOffset,
                        -angleOffset,
                        1);
        
        CGContextSetStrokeColorWithColor(context,self.progresscircleColor.CGColor );
        CGContextStrokePath(context);
    }
    
    CGContextSetLineWidth(context, 0);
}

@end
