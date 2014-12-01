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
        CGRect frame = CGRectMake(43, 10, 240, 380);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor whiteColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        UILabel *scale1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 20)];
        scale1.text = @"100-";
        scale1.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        
        UILabel *scale2 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height * 1/4, 40, 20)];
        scale2.text = @"75-";
        scale2.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        
        UILabel *scale3 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height * 1/2, 40, 20)];
        scale3.text = @"50-";
        scale3.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        
        UILabel *scale4 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height * 0.75, 40, 20)];
        scale4.text = @"25-";
        scale4.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        
        UILabel *scale5 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height, 40, 20)];
        scale5.text = @"0-";
        scale5.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        
        float distance = frame.size.width / (values.count * 2 + 1);
        NSMutableArray *viewArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < values.count; i++) {
            float value = [[values objectAtIndex:i] floatValue];
            float x = distance * (i * 2 + 1) + 50;
            float y = frame.size.height - (value * frame.size.height / 100) + 10;
            float width = distance;
            float height = value * frame.size.height / 100;
            UIView *stlView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            stlView.backgroundColor = [UIColor greenColor];
            stlView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [viewArray addObject:stlView];
        }
        
        [self addSubview:view];
        [self addSubview:scale1];
        [self addSubview:scale2];
        [self addSubview:scale3];
        [self addSubview:scale4];
        [self addSubview:scale5];
        
        for (UIView *stlView in viewArray) {
            [self addSubview:stlView];
        }
        
    }
    return self;
}




@end
