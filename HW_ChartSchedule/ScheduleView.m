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
    self = [super initWithFrame:CGRectMake(0, 0, 300, 400)];
    if (self) {
        NSMutableArray *lables = [[NSMutableArray alloc] init];
        CGRect frame = CGRectMake(50, 10, 240, 360);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        view.backgroundColor = [UIColor whiteColor];
        NSArray *mass = [[NSArray alloc] initWithObjects:@"0", @"25", @"50", @"75", @"100", nil];
        NSMutableArray *views = [[NSMutableArray alloc] init];
        NSMutableArray *lablesA = [[NSMutableArray alloc] init];
        double count = 1;
        float distance = frame.size.width / (values.count * 2 + 1);
        for (int j=0;j<5;j++){
            UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, frame.size.height*count, 40, 20)];
            NSString *s =[NSString stringWithFormat:mass[j]];
            lable.text = s;
            lable.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
            count = count - 0.25f;
            [lables addObject:lable];
        }
        for (int i = 0; i < values.count; i++) {
            float value = [[values objectAtIndex:i] floatValue];
            float x = distance * (i * 2 + 1) + 50;
            float y = frame.size.height - (value * frame.size.height / 100) + 10;
            float width = distance;
            float height = value * frame.size.height / 100;
            UIView *stlView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            stlView.backgroundColor = [UIColor blackColor];
            stlView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [views addObject:stlView];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, 375, 125, 20)];
            NSString *s;
            s =[NSString stringWithFormat:@"t№%d", i];
            label.text = s;
            label.textColor=[UIColor whiteColor];
            label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [lablesA addObject:label];
        }
        [self addSubview:view];
        for (UIView *stlView in views) {
            [self addSubview:stlView];
        }
        for(UILabel *s in lablesA){
            [self addSubview: s];
        }
        for (UILabel *s in lables) {
            [self addSubview:s];
        }
    }
    return self;
}
@end
