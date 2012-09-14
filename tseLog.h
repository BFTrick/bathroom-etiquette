//
//  tseLog.h
//  ToiletSeatEtiquette2
//
//  Created by Patrick Rauland on 9/8/12.
//  Copyright (c) 2012 Patrick Rauland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tseLog.h"
#import "tseLogItem.h"

@interface tseLog : NSObject

@property (strong, nonatomic) NSMutableArray *log;
@property (readwrite) NSInteger numSeatMovements;

- (id)init;
- (void) addLogItem: (tseLogItem *) logItem;
- (NSString *) printLog;

@end
