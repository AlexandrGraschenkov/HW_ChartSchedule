//
//  ScheduleView.m
//  HW_ChartSchedule
//
//  Created by Alexander on 13.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ScheduleView.h"

@implementation ScheduleView


- (id)initWithData:(NSArray*)values
{
    
    
        self = [super initWithFrame:CGRectMake(0, 0, 100, 100)];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        UIView *left_Bottom = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 30, 95)];
        left_Bottom.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        UIView *right_Bottom = [[UIView alloc]initWithFrame:CGRectMake(40, 5, 55, 90)];
        right_Bottom.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        int i ;
        for(i = 0; i<=4; i++){
            UILabel *marks = [[UILabel alloc]initWithFrame:CGRectMake(0, 20*(4-i), 30, 15)];
            marks.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
            [marks setText:[NSString stringWithFormat:@"%d",i*25]];
            
            [left_Bottom addSubview:marks];
            if (i == 4){
                marks.autoresizingMask = UIViewAnimationTransitionNone;
            }
        }
    //[left_Bottom setBackgroundColor:[UIColor blueColor]];
        [self addSubview:left_Bottom];
        size_t width = 55/(values.count+1);
        for (i = 0; i<values.count; i++){
            int val = [[values objectAtIndex:i]integerValue];
            UIView *columns = [[UIView alloc] initWithFrame:CGRectMake((i+1)*width-4, 91-val*0.91, 10, val*0.9)];
            columns.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            [columns setBackgroundColor:[UIColor greenColor ]];
            [right_Bottom addSubview:columns];
        }
     //right_Bottom.backgroundColor = [UIColor colorWithRed:1.000 green:0.889 blue:0.555 alpha:0.000];
        [self addSubview:right_Bottom];
    
    return self;
}




@end
