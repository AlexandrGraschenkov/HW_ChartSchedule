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
      
        
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        UIView *mainView = [[UIView alloc]initWithFrame:frame];
        mainView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        mainView.backgroundColor = [UIColor purpleColor];
        mainView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:mainView];
        
        UIView *whiteView = [[UIView alloc]initWithFrame:frame];
        whiteView.frame = CGRectMake(50, 50, self.frame.size.width - 80, self.frame.size.height - 80);
        whiteView.backgroundColor = [UIColor whiteColor];
        whiteView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        [mainView addSubview:whiteView];
        
        int width = 30;
        int space = (whiteView.frame.size.width - values.count*width)/(values.count+1);
        int currentX = space;
        int currentY = 0;
        int height = 0;
        UIView *view;
        
        for (int i=0; i<[values count]; i++) {
            
            view = [[UIView alloc] initWithFrame:frame];
            height = [[values objectAtIndex:i]intValue]*2.7;
            currentY = whiteView.frame.size.height - height;
            view.frame = CGRectMake (currentX, currentY , width, height);
            view.backgroundColor = [UIColor greenColor];
            view.autoresizingMask =  UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth  | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
            currentX = currentX+space+width;
            [whiteView addSubview:view];
        }
        UIView *viewWithPercent = [[UIView alloc]initWithFrame:frame];
        viewWithPercent.frame = CGRectMake(0, whiteView.frame.origin.y, 40, whiteView.frame.size.height);
        viewWithPercent.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
        //viewWithPercent.backgroundColor = [UIColor greenColor];
        [mainView addSubview:viewWithPercent];
        for (int i=0; i<5; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:frame];
            label.frame = CGRectMake(0, i*whiteView.frame.size.height/5-40, 30, whiteView.frame.size.height/5+100);
            //label.backgroundColor = [UIColor lightGrayColor];
            label.text = [NSString stringWithFormat: @"%d",(4-i)*25];
            label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
            [viewWithPercent addSubview:label];
        }
        
    }
    return self;
}




@end
