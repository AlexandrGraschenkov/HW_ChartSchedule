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
    self = [super initWithFrame:CGRectMake(0,0,100,110)];
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    UIView *leftside = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 30, 100)];
    leftside.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    for(int i = 4 ; i >= 0 ; i--){
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 21*i, 30, 15)];
        label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        [label setText:[NSString stringWithFormat: @"%d", (4-i)*25]];
        [leftside addSubview:label];
        
        if (i == 0) {
            label.autoresizingMask = UIViewAnimationTransitionNone;
        }
    }
    
    [self addSubview:leftside];
    
    UIView *rightside = [[UIView alloc] initWithFrame:CGRectMake(35, 5, 50, 100)];
    [rightside setBackgroundColor:[UIColor whiteColor]];
    rightside.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    size_t width = 50/(values.count + 1);
    
    for(int i = 0; i < values.count; i++){
        int val = [[values objectAtIndex:i] integerValue];
        
        UIView *graph = [[UIView alloc] initWithFrame:CGRectMake((i+1)*width - 4, 100 - val, 10, val)];
        
        [graph setBackgroundColor:[UIColor greenColor]];
        
        graph.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        [rightside addSubview:graph];
    }
    
    [self addSubview:rightside];    return self;
}




@end
