//
//  BreakingLikeSurfonaShoreUntilView.m
//  BreakingLikeSurfonaShoreUntil
//
//  Created by Eric Li on 10/8/18.
//  Copyright © 2018 O-R-G. All rights reserved.
//

#import "BreakingLikeSurfonaShoreUntilView.h"

@implementation BreakingLikeSurfonaShoreUntilView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/10.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    [self initValues];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    NSColor *color;
    NSSize boxSize = NSMakeSize( size.height / 150 , size.height / 150 );
    
    // Draw boxes
    NSUInteger index = 0;
    NSUInteger colorIdx = 0;
    for (NSValue *pointValue in points) {
        if (index % 1000 == 0) {
            color = [colors objectAtIndex:colorIdx];
            [color set];
            colorIdx++;
        }
        
        NSRect boxRect;
        boxRect.size = boxSize;
        NSPoint point = [pointValue pointValue];
        boxRect.origin = point;

        NSRectFill(boxRect);
        
        index++;
    }
    return;
}

- (void)animateOneFrame
{
    BOOL reduce = FALSE;
    if ([points count] >= 200000) {
        reduce = TRUE;
    }
    
    if (reduce) {
        [colors removeObjectAtIndex:0];
    }
    
    NSColor *color = [NSColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    
    if ( (int) SSRandomFloatBetween( 1, 2 ) == 1 )
    {
        color = [NSColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    }
    
    if ( (int) SSRandomFloatBetween( 1, 3 ) == 2 )
    {
        color = [NSColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    }
    
    [colors addObject:color];
    
    for (int j = 0; j < 1000; j++)
    {
        if (reduce) {
            [points removeObjectAtIndex:0];
        }

        int xPos = (int) SSRandomFloatBetween( 0, size.width ) % (int) size.width;
        int yPos = (int) SSRandomFloatBetween( 0, size.height ) % (int) size.height;
        NSPoint newPoint = NSMakePoint(xPos, yPos);
        [points addObject: [NSValue valueWithPoint:newPoint]];

    }

    [self setNeedsDisplay:YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void) initValues
{
    theta = 0.0;
    alpha = 1.0; // for the lines
    size = [self bounds].size;
    
    points = [[NSMutableArray alloc] init];
    colors = [[NSMutableArray alloc] init];
    
    NSColor *color = [NSColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    
    if ( (int) SSRandomFloatBetween( 1, 2 ) == 1 )
    {
        color = [NSColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    }
    
    if ( (int) SSRandomFloatBetween( 1, 3 ) == 2 )
    {
        color = [NSColor colorWithCalibratedRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    }
    
    [colors addObject:color];
    
    for (int j = 0; j < 1000; j++)
    {
        int xPos = (int) SSRandomFloatBetween( 0, size.width ) % (int) size.width;
        int yPos = (int) SSRandomFloatBetween( 0, size.height ) % (int) size.height;
        NSPoint newPoint = NSMakePoint(xPos, yPos);
        [points addObject: [NSValue valueWithPoint:newPoint]];
        
    }
    
}
@end
