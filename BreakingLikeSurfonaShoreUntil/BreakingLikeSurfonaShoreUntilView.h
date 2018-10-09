//
//  BreakingLikeSurfonaShoreUntilView.h
//  BreakingLikeSurfonaShoreUntil
//
//  Created by Eric Li on 10/8/18.
//  Copyright © 2018 O-R-G. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface BreakingLikeSurfonaShoreUntilView : ScreenSaverView {
    float theta, alpha;
    NSSize size;
    
    NSMutableArray *points;
    NSMutableArray *colors;
    
}

- (void) initValues;
@end
