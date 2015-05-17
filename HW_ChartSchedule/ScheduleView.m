//
//  ScheduleView.m
//  HW_ChartSchedule
//
//  Created by Alexander on 13.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ScheduleView.h"

@implementation ScheduleView

-(void)FlexibleTopMargin: (UILabel *)label
{
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
}

// количество элементов может менятся, ваша задача раcположить их равномерно
- (id)initWithData:(NSArray*)values
{
    self = [super initWithFrame:CGRectMake(0, 0, 300, 400)];
    if (self) {
        CGRect frame = CGRectMake(50, 10, 240, 360);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor whiteColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        UILabel *sc1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 40, 20)];
        UILabel *sc2 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height * 1/4, 40, 20)];
        UILabel *sc3 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height * 1/2, 40, 20)];
        UILabel *sc4 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height * 0.75, 40, 20)];
        UILabel *sc5 = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height, 40, 20)];
        
        sc1.text = @"100-";
        sc2.text = @"75-";
        sc3.text = @"50-";
        sc4.text = @"25-";
        sc5.text = @"0-";
        
        [self FlexibleTopMargin:sc1];
        [self FlexibleTopMargin:sc2];
        [self FlexibleTopMargin:sc3];
        [self FlexibleTopMargin:sc4];
        [self FlexibleTopMargin:sc5];
        
        float distance = frame.size.width / (values.count * 2 + 1);
        NSMutableArray *viewArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < values.count; i++) {
            float value = [[values objectAtIndex:i] floatValue];
            float x = distance * (i * 2 + 1) + 50;
            float y = frame.size.height - (value * frame.size.height / 100) + 10;
            float width = distance;
            float height = value * frame.size.height / 100;
            UIView *stlView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            stlView.backgroundColor = [UIColor blueColor];
            stlView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [viewArray addObject:stlView];
        }
        
        [self addSubview:view];
        [self addSubview:sc1];
        [self addSubview:sc2];
        [self addSubview:sc3];
        [self addSubview:sc4];
        [self addSubview:sc5];
        
        for (UIView *stlView in viewArray) {
            [self addSubview:stlView];
        }
        
    }
    return self;
}




@end
