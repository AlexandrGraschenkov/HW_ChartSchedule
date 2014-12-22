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
    NSArray *colorsArr = [[NSArray alloc] initWithObjects:  [UIColor greenColor],
                                                            [UIColor redColor],
                                                            [UIColor blueColor],
                                                            [UIColor yellowColor],
                                                            [UIColor cyanColor], nil];
    
    self = [super initWithFrame:CGRectMake(0, 0, 300, 400)];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 10, 240, 360)];
        view.backgroundColor = [UIColor whiteColor];
        view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        view.clipsToBounds = NO;
        
        float gridElement = view.frame.size.width / (values.count * 2 + 1);
        
        for (int i=0; i < values.count; i++) {
            CGFloat value = [[values objectAtIndex:i] floatValue];
            CGFloat width = gridElement;
            CGFloat height = value / 100 * view.frame.size.height;
            CGFloat x = gridElement * ( 1 + 2*i );
            CGFloat y = view.frame.size.height - height;
            
            UIView *elemView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
            elemView.backgroundColor = [colorsArr objectAtIndex:(i % colorsArr.count)];
            elemView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                        UIViewAutoresizingFlexibleHeight |
                                        UIViewAutoresizingFlexibleTopMargin |
                                        UIViewAutoresizingFlexibleRightMargin |
                                        UIViewAutoresizingFlexibleLeftMargin;
            [view addSubview:elemView];
        }
        [self addSubview:view];
        
#pragma mark - add marks on left side
        UIView *leftBarView = [[UIView alloc] initWithFrame:CGRectMake(-40, 0, 40, 360)];
        leftBarView.backgroundColor = [UIColor clearColor];
        leftBarView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
        leftBarView.clipsToBounds = NO;
        
        for (int i=0; i<5; i++) {
            UILabel *mark = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                      leftBarView.frame.size.height * ((4-i) * 0.25f) - 10 - (i==0 ? 2 : 0),
                                                                      leftBarView.frame.size.width,
                                                                      20)];
            mark.text = [NSString stringWithFormat:@"%i–", 25 * i];
            mark.textAlignment = NSTextAlignmentRight;
            mark.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                    UIViewAutoresizingFlexibleBottomMargin |
                                    UIViewAutoresizingFlexibleHeight;
            [leftBarView addSubview:mark];
        }
        [view addSubview:leftBarView];
        
#pragma mark - add labels on the bottom of table
        UIView *bottomBarView = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height, view.frame.size.width, 20)];
        bottomBarView.backgroundColor = [UIColor clearColor];
        bottomBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        for (int i=0; i <values.count; i++) {
            UILabel *elemLabel = [[UILabel alloc] initWithFrame:CGRectMake(gridElement * ( 1 + 2*i) , 0, gridElement, 20)];
            elemLabel.text = [NSString stringWithFormat:@"obj %i", i];
            elemLabel.textAlignment = NSTextAlignmentCenter;
            elemLabel.adjustsFontSizeToFitWidth = YES;
            elemLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
            [bottomBarView addSubview:elemLabel];
        }
        [view addSubview:bottomBarView];
    }
    return self;
}




@end
