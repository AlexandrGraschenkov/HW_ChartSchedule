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
        CGRect frame = CGRectMake(45,10,240,380);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = [UIColor whiteColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        NSMutableArray *arrayForView = [NSMutableArray new];
        float dist =  frame.size.width / (values.count * 2 + 1);
        float width = dist;
        for (int i=0; i<values.count; i++) {
            float value = [[values objectAtIndex:i]floatValue];
            float x = dist * (i*2+1)+40;
            float y = frame.size.height - (value * frame.size.height / 100) + 10;
            float height = value*frame.size.height/100;
            UIView *stickView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
            stickView.backgroundColor = [UIColor greenColor];
            stickView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
            [arrayForView addObject:stickView];
        }
        
        [self addSubview:view];
        
        CGFloat x; CGFloat y;
        CGFloat widthCG = 40;
        CGFloat heightCG = 20;
        float k = 0.0; NSInteger text=100;
        for (int i=0; i<5; i++) {
            x = (i>0) ? (15) : (10);
            y = (i>0) ? (frame.size.height * k) : (0);
            CGRect temp = CGRectMake(x,y, widthCG, heightCG);
            UILabel *tag = [[UILabel alloc]initWithFrame:temp];
            tag.text = [@(text) stringValue];
            tag.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
            [self addSubview:tag];
            k+=0.25; text-=25;
        }
        
        for (UIView *stick in arrayForView) {
            [self addSubview:stick];
        }
        
    }
    return self;
}




@end
