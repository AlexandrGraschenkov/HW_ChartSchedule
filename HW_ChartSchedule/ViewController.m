//
//  ViewController.m
//  HW_ChartSchedule
//
//  Created by Alexander on 13.03.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"
#import "ScheduleView.h"

@interface ViewController ()
{
    ScheduleView *scheduleView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ios-lab-starts-creen"]];
    bgImageView.frame = self.view.bounds;
    [UIView animateWithDuration:3.0 animations:^{
        [self.view addSubview:bgImageView];
        [self.view sendSubviewToBack:bgImageView];
    }];
    
    NSMutableArray *dataArr = [NSMutableArray new];
    int count = arc4random() % 3 + 1;
    for(int i = 0; i < count; i++){
        [dataArr addObject:@(arc4random() % 50 + 25)];
    }
    NSLog(@"%@", dataArr);
    scheduleView = [[ScheduleView alloc] initWithData:dataArr];
    scheduleView.frame = CGRectMake(10, 50, 300, 400);
    scheduleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scheduleView];
}

- (void)runInfiniteAnim
{
    [UIView animateWithDuration:1.0 animations:^{
        CGRect frame = scheduleView.frame;
        frame.size.width -= 100;
        scheduleView.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            CGRect frame = scheduleView.frame;
            frame.size.height -= 100;
            scheduleView.frame = frame;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 animations:^{
                CGRect frame = scheduleView.frame;
                frame.size.width += 100;
                frame.size.height += 100;
                scheduleView.frame = frame;
            } completion:^(BOOL finished) {
                [self runInfiniteAnim];
            }];
        }];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self runInfiniteAnim];
}

@end
