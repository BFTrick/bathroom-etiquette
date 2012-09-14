//
//  tseLog.m
//  ToiletSeatEtiquette2
//
//  Created by Patrick Rauland on 9/8/12.
//  Copyright (c) 2012 Patrick Rauland. All rights reserved.
//

#import "tseLog.h"
#import "tseLogItem.h"

@implementation tseLog

@synthesize log, numSeatMovements;

-(void) addLogItem: (tseLogItem *)logItem{
    //add an item to the log
    [log addObject:logItem];
}

-(NSString *) printLog{
    //print the log and return it
    
    NSString *result = [[NSString alloc] init];
    
    //loop through each entry
    for (tseLogItem *logItem in log) {
        //TODO
        //first check to see if there is a seat movement
        if( [logItem seatMovement] ){
            //figure out the seat direction
            NSString *seatMovementMessage = [[NSString alloc] initWithFormat:@"down"];
            if([logItem seatMovementDirectionUp]){
                seatMovementMessage = @"up";
            }
            NSString *messageLog = [[NSString alloc] initWithFormat:@"Seat movement %@", seatMovementMessage];
            result = [result stringByAppendingString:messageLog];
        }
        else{
            //no seat movement
            result = [result stringByAppendingString:@"No seat movement"];
        }
        //add new line character
        result = [result stringByAppendingString:@"\n"];
    }
    
    NSLog(@"Results: %@", result);
    return result;
}

-(id)init
{
    if (self = [super init])
    {
        // Initialization code here
        log = [[NSMutableArray alloc] init];
        numSeatMovements = 0;
    }
    return self;
}

@end
