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
        // example
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.text = @"На этом месте\n могла быть\n ваша реклама";
        label.backgroundColor = [UIColor clearColor];
        label.numberOfLines = 0;
        label.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:label];
        NSMutableArray *lables = [[NSMutableArray alloc] init];
        CGRect frame = CGRectMake(50, 10, 240, 360);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor whiteColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        NSArray *array = [[NSArray alloc] initWithObjects:@"0", @"10",@"20",@"30",@"60",@"100", nil];
        double count = 1; 
        int countOfObjects = 0;
        while(countOfObjects < 6 ){
        
         UILabel *newlabel = [[UILabel alloc] initWithFrame:CGRectMake(15, frame.size.height*count, 40, 20)];
            NSString *make =[NSString stringWithFormat: @"%@-", array[countOfObjects]];
            newlabel.text = make;
            newlabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
            count = count - 0.25f;
            [lables addObject:newlabel];
           countOfObjects++;
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
            [self addSubview: view];
            
            for(UIView *newView in viewAray){
            [self addSubview: newView];
        }
    for (UILabel *i in lables){
        [self addSubview: i];
    }
    
    }
    return self;
}




@end
