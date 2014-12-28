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
        NSMutableArray *lables = [[NSMutableArray alloc] init];
        NSMutableArray *viewArr = [[NSMutableArray alloc] init];
        NSMutableArray *lableArr = [[NSMutableArray alloc] init];
        NSArray *myArr = [[NSArray alloc] initWithObjects:@"0", @"25", @"50", @"75", @"100", nil];
        CGRect myFr = CGRectMake(50, 10, 240, 360);
        UIView *view = [[UIView alloc] initWithFrame:myFr];
        view.backgroundColor = [UIColor whiteColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        float space = myFr.size.width / (values.count * 2 + 1);
        
        double count = 1;
        int temp = 0;
        while(temp < 5) {
            
            UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(15, myFr.size.height*count, 40, 20)];
            NSString *string =[NSString stringWithFormat: @"%@-", myArr[temp]];
            lable.text = string;
            lable.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
            count = count - 0.25f;
            [lables addObject:lable];
            temp++;
        }
        
        
        
        for (int i = 0; i < values.count; i++) {
            
            float val = [[values objectAtIndex:i] floatValue];
            float a = space * (i * 2 + 1) + 50;
            float b = myFr.size.height - (val * myFr.size.height / 100) + 10;
            float width = space;
            float height = val * myFr.size.height / 100;
            UIView *stlView = [[UIView alloc] initWithFrame:CGRectMake(a, b, width, height)];
            
            stlView.backgroundColor = [UIColor brownColor];
            stlView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [viewArr addObject:stlView];
            
            UILabel *lable2 = [[UILabel alloc] initWithFrame:CGRectMake(a, 375, 125, 20)];
            NSString *string2;
            string2 =[NSString stringWithFormat: @"Diadr %d", i+1];
            lable2.text = string2;
            lable2.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [lableArr addObject:lable2];
        }
        
        [self addSubview:view];
        
        for (UIView *stlView in viewArr) {
            [self addSubview:stlView];
        }
        
        for(UILabel *s in lableArr){
            [self addSubview: s];
        }
        
        for (UILabel *s in lables) {
            [self addSubview:s];
        }
        
    }
    return self;
}




@end