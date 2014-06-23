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
        
                for (int i = 0; i < 5; i++) {
                    float position=(labels.frame.size.height)/5*(4-i);
                    NSLog(@"%f",position);
                        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, position, 30, 15)];
                        [label setTextAlignment:NSTextAlignmentCenter];
                        [label setText:[NSString stringWithFormat:@"%d", i*25]];
                        label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleTopMargin;
                        if (i == 4) {
                                label.autoresizingMask = UIViewAutoresizingNone;
                            }
                        [labels addSubview:label];
                    }
        
                [self addSubview:labels];
        
                UIView *charts = [[UIView alloc] initWithFrame:CGRectMake(45, 12.5, 42.5, 75)];
                [charts setBackgroundColor:[UIColor whiteColor]];
                charts.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
                size_t size = 42.5/(values.count+1);
        
                for (int i = 1; i <= values.count; i++) {
                        int value = [[values objectAtIndex:i-1] integerValue];
                        UIView *viewsValues = [[UIView alloc] initWithFrame:CGRectMake(i*size-2.5, (76-value*0.75), 5, value*0.75)];
                        [viewsValues setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0.51 alpha:1]];
                        viewsValues.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
                        [charts addSubview:viewsValues];
                    }
        
            [self addSubview:charts];
        
    }
    return self;
}




@end
