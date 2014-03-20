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
    if (self) {
        
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        UIView *labels = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 30, 90)];
        labels.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        NSArray *positions = @[@75, @56.25, @37.5, @18.75, @0];
        
        for (int i = 0; i < 5; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, [positions[i] doubleValue], 30, 15)];
            [label setTextAlignment:NSTextAlignmentCenter];
            [label setText:[NSString stringWithFormat:@"%d", i*25]];
            label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleTopMargin;
            if (i == 4) {
                label.autoresizingMask = UIViewAutoresizingNone;
            }
            [labels addSubview:label];
        }
        
        [self addSubview:labels];
        
        UIView *graph = [[UIView alloc] initWithFrame:CGRectMake(45, 12.5, 42.5, 75)];
        [graph setBackgroundColor:[UIColor whiteColor]];
        graph.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        size_t sector = 42.5/(values.count+1);
        
        for (int i = 1; i <= values.count; i++) {
            NSInteger value = [(NSNumber *)[values objectAtIndex:i-1] integerValue];
            UIView *valueView = [[UIView alloc] initWithFrame:CGRectMake(i*sector-2.5, (76-value*0.75), 5, value*0.75)];
            [valueView setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0.51 alpha:1]];
            valueView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [graph addSubview:valueView];
        }
        
        [self addSubview:graph];
        
    }
    return self;
}




@end
