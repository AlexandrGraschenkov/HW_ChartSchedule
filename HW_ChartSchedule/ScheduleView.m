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
// количество элементов может менятся, ваша задача раcположить их равномерно
- (id)initWithData:(NSArray*)values
{
    self = [super initWithFrame:CGRectMake(0, 0, 300, 400)];
    if (self) {
        NSMutableArray *lables = [[NSMutableArray alloc] init];
        CGRect frame = CGRectMake(50, 10, 240, 360);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor whiteColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        NSArray *array = [[NSArray alloc] initWithObjects:@"0", @"25", @"50", @"75", @"100", nil];
        double count = 1;
        int j = 0;
        while(j < 5) {
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height*count, 40, 20)];
            NSString *s =[NSString stringWithFormat: @"%@-", array[j]];
            lbl.text = s;
            lbl.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
            count = count - 0.25f;
            [lables addObject:lbl];
            j++;
        }
        
        float distance = frame.size.width / (values.count * 2 + 1);
        NSMutableArray *viewArray = [[NSMutableArray alloc] init];
        NSMutableArray *lablArray = [[NSMutableArray alloc] init];
        
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
            
            UILabel *labl = [[UILabel alloc] initWithFrame:CGRectMake(x, 375, 125, 20)];
            NSString *s;
            s =[NSString stringWithFormat: @"num %d", i];
            labl.text = s;
            labl.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [lablArray addObject:labl];
        }
        
        [self addSubview:view];
        
        for (UIView *stlView in viewArray) {
            [self addSubview:stlView];
        }
        
        for(UILabel *s in lablArray){
            [self addSubview: s];
        }
        
        for (UILabel *s in lables) {
            [self addSubview:s];
        }
        
    }
    return self;
}





@end
