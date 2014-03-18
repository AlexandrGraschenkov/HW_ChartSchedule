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
    self = [super initWithFrame:CGRectMake(0, 0, 300, 400)];
    if (self) {
        NSLog(@"%d", values.count);
        UIView *valuesView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 40, 380)];
        valuesView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        for (int i = 0; i < 5; i++)
        {
            UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, i * 90, 40, 22)];
            valueLabel.text = [NSString stringWithFormat:@"%d", ((4-i) * 25)];
            valueLabel.textAlignment = NSTextAlignmentCenter;
            valueLabel.backgroundColor = [UIColor clearColor];
//            little funny :)
//            valueLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            valueLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
            [valuesView addSubview:valueLabel];
        }
        UIView *chartView = [[UIView alloc] initWithFrame:CGRectMake(50, 10, 240, 380)];
        chartView.backgroundColor = [UIColor grayColor];
        chartView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        for (int i = 0; i < values.count; i++)
        {
            UIView *columnView = [[UIView alloc] initWithFrame:CGRectMake(((240*(i+1))/([values count] + 1)) - (240/([values count] + 2))/2, 370, (240/([values count] + 2)), -1 * ([[values objectAtIndex:i] floatValue] * 3.6))];
            columnView.backgroundColor = [UIColor colorWithRed:(173.0/255) green:1.0 blue:(47.0/255) alpha:1.0];
            columnView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
            [chartView addSubview:columnView];
        }
        [self addSubview:valuesView];
        [self addSubview:chartView];
    }
    return self;
}




@end
