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


#define BASIC_WIDTH 300
#define BASIC_HEIGHT 400

- (id)initWithData:(NSArray*)values
{
    self = [super initWithFrame: CGRectMake(0, 0, BASIC_WIDTH, BASIC_HEIGHT)];
    if (self) {
        
        NSArray *views = [self getCGRectTemplates:values];
        for(UIView *currentView in views) {
            currentView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            [self addSubview:currentView];
        }
        
        NSArray *labels = [self getLabels];
        for (UILabel *label in labels) {
            label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            [label sizeToFit];
            [self addSubview:label];
        }
        
        
    }
    return self;
}


#define START_LABELS 4
#define LABEL_SPACES_COUNT 5

- (NSArray *)getLabels {
    NSMutableArray *labels = [[NSMutableArray alloc] init];
    
    int startYPoint = 0;
    for(int i = 100; i > -1; i-=20) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(START_LABELS, startYPoint, BASIC_WIDTH - START_LABELS, (BASIC_HEIGHT - START_LABELS) / LABEL_SPACES_COUNT)];
        startYPoint += BASIC_HEIGHT / LABEL_SPACES_COUNT;
        label.text = [NSString stringWithFormat:@"%d", i];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        [labels addObject:label];
    }
    
    return [NSArray arrayWithArray:labels];
}


#define INFO_BLOCK_WIDTH 50
#define PADDING 28

- (NSArray *)getCGRectTemplates:(NSArray *)values {
    NSInteger size = [values count];
    NSInteger x = (BASIC_WIDTH - INFO_BLOCK_WIDTH - PADDING * size) / size;
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    UIView *infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, INFO_BLOCK_WIDTH, BASIC_HEIGHT)];
    infoView.backgroundColor = [UIColor clearColor];
    [views addObject:infoView];
    
    int startXPoint = INFO_BLOCK_WIDTH;
    for (int num = 0; num < size; num++) {
        
        UIView *blankView = [[UIView alloc] initWithFrame:CGRectMake(startXPoint, 0, PADDING, BASIC_HEIGHT)];
        blankView.backgroundColor = [UIColor clearColor];
        [views addObject:blankView];
        startXPoint += PADDING;
        
        int valueRange = [[ScheduleView getParametricHeightFor:[values objectAtIndex:num]] intValue];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(startXPoint, BASIC_HEIGHT - valueRange, x, valueRange)];
        NSLog(@"%d", valueRange);
        view.backgroundColor = [UIColor whiteColor];
        [views addObject:view];
        startXPoint += x;
    }
    return [NSArray arrayWithArray:views];
}

+ (NSNumber *)getParametricHeightFor:(NSNumber *)value {
    return [[NSNumber alloc] initWithFloat:(BASIC_HEIGHT / 100 * [value intValue])];
}




@end
