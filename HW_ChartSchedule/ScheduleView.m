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
       CGRect frame = CGRectMake(50, 10, 240, 380);
        NSArray *labels = [[NSArray alloc] initWithObjects:@"100-", @"75-", @"50-",@"25-",@"0-", nil];
   
    
            UIView *view = [[UIView alloc] initWithFrame:frame];
            view.backgroundColor = [UIColor whiteColor];
            view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        NSMutableArray *sc= [[NSMutableArray alloc] init];
        CGFloat d = 0.f;
        for(id str in labels){
            UILabel *scale = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height * d, 40, 20)];
            scale.text = str;
            scale.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
            d+=0.25;
            [sc addObject:scale];
        
        }
        
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
        for(id scale in sc){
        [self addSubview:scale];
        }
        
            
            for (UIView *stlView in viewArray) {
                [self addSubview:stlView];
            }
       
             }
             return self;
}




@end
