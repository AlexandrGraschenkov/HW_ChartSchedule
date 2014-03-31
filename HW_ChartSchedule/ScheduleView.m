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
        
        int COUNT = [values count];
        NSLog(@"count: %i",COUNT);
        
        if (COUNT==0){
            NSLog(@"Все плохо, массив пуст");
        }
        else {
            CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            
            UIView *mainView = [[UIView alloc]initWithFrame:frame];
            mainView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:220/255.0 alpha:1.0];
            mainView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            [self addSubview:mainView];
            
            //добавляем оси координат
            //вертикальная
            CGRect axisFirstFrame = CGRectMake(50, 20, 1, self.frame.size.height-60);
            UIView *axisFirst = [[UIView alloc]initWithFrame:axisFirstFrame];
            axisFirst.backgroundColor = [UIColor blackColor];
            axisFirst.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
            UIViewAutoresizingFlexibleTopMargin|
            UIViewAutoresizingFlexibleBottomMargin|
            UIViewAutoresizingFlexibleRightMargin|
            UIViewAutoresizingFlexibleHeight;
            [mainView addSubview:axisFirst];
            
            //горизонтальная
            CGRect axisSecondFrame = CGRectMake(50, self.frame.size.height-40, self.frame.size.width-70, 1);
            UIView *axisSecond = [[UIView alloc]initWithFrame:axisSecondFrame];
            axisSecond.backgroundColor = [UIColor blackColor];
            axisSecond.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
            UIViewAutoresizingFlexibleBottomMargin|
            UIViewAutoresizingFlexibleTopMargin|
            UIViewAutoresizingFlexibleRightMargin|
            UIViewAutoresizingFlexibleWidth;
            [mainView addSubview:axisSecond];
            
            
            
            
            // добавляем значения на вертикальную ось(length = 340)
            
            NSMutableArray *numbers = [NSMutableArray new];
            UILabel *label;
            
            int counter = 0;
            int y=self.frame.size.height-60;
            for (int i=0; i<17;i++){
                
                CGRect labelFrame = CGRectMake(20, y, 30, 20);
                label=[[UILabel alloc] initWithFrame:labelFrame];
                
                label.text = [@(counter) stringValue];
                label.font = [UIFont boldSystemFontOfSize:10.0f];
                label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
                UIViewAutoresizingFlexibleBottomMargin|
                UIViewAutoresizingFlexibleTopMargin|
                UIViewAutoresizingFlexibleRightMargin|
                UIViewAutoresizingFlexibleWidth;
                
                if (label!=nil)
                    [numbers addObject:label];
                else NSLog(@"label is nil =( step %i",i);
                
                [mainView addSubview:numbers[i]];
                
                label = nil;
                counter+=10;
                y-=20;
                
            }
            
            //создаем массив вьюшек - собственно столбцов-показателей графика
            NSMutableArray *viewsArray = [NSMutableArray new];
            UIView *view;
            int SELF_X = (self.frame.size.width-70)/COUNT-5;
            NSLog(@"count uiiii %i",SELF_X);
            int x=55;
            float red=0;
            float green=0;
            float blue=0;
            //int rr= frame.size.height-[values[i] integerValue];
            
            for (int i=0; i< COUNT; i++) {
                CGRect viewFrame = CGRectMake(x, frame.size.height-40-[values[i] integerValue], SELF_X, [values[i] integerValue]);
                view = [[UIView alloc]initWithFrame:viewFrame];
                
                red = [@(arc4random() % 255) floatValue]/255;
                green = [@(arc4random() % 255) floatValue]/255;
                blue = [@(arc4random() % 255) floatValue]/255;
                view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
                view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|
                UIViewAutoresizingFlexibleBottomMargin|
                UIViewAutoresizingFlexibleTopMargin|
                UIViewAutoresizingFlexibleRightMargin|
                UIViewAutoresizingFlexibleWidth;
                
                if (view!=nil)
                    [viewsArray addObject:view];
                else NSLog(@"view is nil =( step %i",i);
                
                [mainView addSubview:viewsArray[i]];
                
                x+=SELF_X+5;
                view=nil;
            }
            
            
        }
        
    }
    return self;
}




@end

