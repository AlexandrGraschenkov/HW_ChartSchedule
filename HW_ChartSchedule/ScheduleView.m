//
//  ScheduleView.m
//  HW_ChartSchedule
//
//  Created by Alexander on 13.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ScheduleView.h"

@implementation ScheduleView

// количество элементов может менятся, ваша задача раcположить их равномерно
- (id)initWithData:(NSArray*)values
{
    self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIView *left = [[UIView alloc] initWithFrame:CGRectMake(4, 4, 32, 92)];
    left.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    for(int i = 0; i < 5; i++) {
        UILabel *labels = [[UILabel alloc] initWithFrame:CGRectMake(0, 19.5*(4-i), 30, 15)];
        labels.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [labels setText:[NSString stringWithFormat:@"%d", i*25]];
        [left addSubview:labels];
        if (i == 4) {
            labels.autoresizingMask = UIViewAnimationTransitionNone;
        }
    }
    [self addSubview:left];
    
    UIView *right = [[UIView alloc] initWithFrame:CGRectMake(40, 5, 56, 91)];
    right.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [right setBackgroundColor:[UIColor whiteColor]];
    size_t width = 56 / (values.count + 1);
    for(int i = 0; i < values.count; i++) {
        int value = [[values objectAtIndex:i] integerValue];
        UIView *graphs = [[UIView alloc] initWithFrame:CGRectMake((i+1)*width-4, 91-value*0.91, 10, value*0.91)];
        [graphs setBackgroundColor:[UIColor greenColor]];
        graphs.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [right addSubview:graphs];
    }
    [self addSubview:right];
    
    return self;
}

@end
