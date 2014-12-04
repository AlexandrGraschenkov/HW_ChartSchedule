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
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIView *scaleHeight = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 400)];
    scaleHeight.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    int value = 100;
    for (int i = 0; i <= 4; i++) {
        UILabel *height = [[UILabel alloc] initWithFrame: CGRectMake(7, 95*i, 40, 20)];
        height.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAnimationTransitionNone | UIViewAutoresizingFlexibleHeight;
        height.text = [[NSNumber numberWithInt:value] stringValue];
        value -= 25;
        [self addSubview: height];
        
    }
    [self addSubview: scaleHeight];
    
    UIView *graphsWindow = [[UIView alloc] initWithFrame:CGRectMake(40, 10, 250, 380)];
    graphsWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    graphsWindow.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < values.count; i++) {
        UIView *graphs = [[UIView alloc] initWithFrame:CGRectMake(250/(values.count)*i+40, 380 - ([[values objectAtIndex:i] integerValue]*3.8), 220/(values.count*2), [[values objectAtIndex:i] integerValue]*3.8)];
        graphs.backgroundColor = [UIColor greenColor];
        graphs.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [graphsWindow addSubview:graphs];
    }
    
    [self addSubview:graphsWindow];
    
    return self;
}




@end
