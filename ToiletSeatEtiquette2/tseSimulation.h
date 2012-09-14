//
//  tseSimulation.h
//  ToiletSeatEtiquette2
//
//  Created by Patrick Rauland on 9/7/12.
//  Copyright (c) 2012 Patrick Rauland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tsePerson.h"
#import "tseToilet.h"
#import "tseLog.h"

@interface tseSimulation : NSObject

@property (readwrite) NSInteger days;
@property (readwrite) NSInteger bathroomVisitsPerDay;
@property (readwrite) NSInteger averagePercentSittingTrips; //the percentage of trips (guys make) where they have to sit
@property (readwrite) NSInteger numMales;
@property (readwrite) NSInteger numFemales;
@property (strong, nonatomic) NSMutableArray *bathroomTrips;
@property (strong, nonatomic) tseLog *courteousMethodLog;
@property (strong, nonatomic) tseLog *selfishMethodLog;
@property (strong, nonatomic) tseToilet *theToilet;


- (id) init;
- (void) simulate;
- (NSInteger) getNumCourteousSeatMovements;
- (NSInteger) getNumSelfishSeatMovements;

@end
