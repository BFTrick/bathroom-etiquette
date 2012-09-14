//
//  tseSimulation.m
//  ToiletSeatEtiquette2
//
//  Created by Patrick Rauland on 9/7/12.
//  Copyright (c) 2012 Patrick Rauland. All rights reserved.
//

#import "tseSimulation.h"
#import "tsePerson.h"
#import "tseToilet.h"
#import "tseLog.h"
#import "tseLogItem.h"
#import "tseNSMutableArray+Shuffling.h"

@implementation tseSimulation

@synthesize days, bathroomVisitsPerDay, averagePercentSittingTrips, numMales, numFemales, bathroomTrips, courteousMethodLog, selfishMethodLog, theToilet;

- (void)simulate
{
    //this method simulates the bathroom trips made by a given number of people
    //it tracks how many times they move the toilet seat up or down
    
    //create the order of people
    [self createPeople];
    
    //simulate the bathroom trips
    [self simulateBathroomTrips];
    
    //print results
    //[convenientMethodLog printLog];
    //[selfishMethodLog printLog];
}

- (void)createPeople{
    //create the people that go to the bathroom
    
    //get the number of people we will have to make
    NSInteger malesToMake = numMales * bathroomVisitsPerDay * days;
    NSInteger femalesToMake = numMales * bathroomVisitsPerDay * days;
    
    NSInteger i = 0;
    //add ladies
    for (i=0; i<femalesToMake; i++) {
        tsePerson *newPerson = [[tsePerson alloc] init];
        [newPerson setIsFemale:YES];
        [newPerson setIsSittingPosition:YES];
        
        //add to array
        [bathroomTrips addObject:newPerson];
    }
    //add guys
    for (i=0; i<malesToMake; i++) {
        tsePerson *newPerson = [[tsePerson alloc] init];
        [newPerson setIsFemale:NO];
        
        //we need to figure out if they are sitting or standing
        // Get random value between 0 and 99
        NSInteger randomNumber = arc4random() % 100;
        if(averagePercentSittingTrips >= randomNumber){
            //sitting
            [newPerson setIsSittingPosition:YES];
        }
        else{
            //standing
            [newPerson setIsSittingPosition:NO];
        }
        
        //add to array
        [bathroomTrips addObject:newPerson];
    }
    
    //randomize people
    [bathroomTrips shuffle];
    
}

-(void)simulateBathroomTrips{
    //simulate the bathroom trips

    NSInteger i = 0;
    NSInteger x = 0;
    //loop through each trip
    for (i=0; i<[bathroomTrips count]; i++) {
     
        //first calculate the number of seat movements for the courteous method
        if(([[bathroomTrips objectAtIndex:i] isSittingPosition] == NO)){
            //someone is standing in the bathroom
            
            //add two toilet seat movements to the log (one for up at the beginning; one for down at the end)
            for (x=0; x<2; x++) {
                tseLogItem *newLogItem = [[tseLogItem alloc] init];
                [newLogItem setPerson:[bathroomTrips objectAtIndex:i]];
                [newLogItem setSeatMovement:YES];
                if (x==0) {
                    [newLogItem setSeatMovementDirectionUp:YES];
                } else {
                    [newLogItem setSeatMovementDirectionUp:NO];
                }
                [courteousMethodLog addLogItem:newLogItem];
                
                //increment the total seat movements up by one
                [courteousMethodLog setNumSeatMovements:[courteousMethodLog numSeatMovements]+1];
            }
        }
        else{
            //someone is sitting in the bathroom - no seat movement
            tseLogItem *newLogItem = [[tseLogItem alloc] init];
            [newLogItem setPerson:[bathroomTrips objectAtIndex:i]];
            [newLogItem setSeatMovement:NO];
            [courteousMethodLog addLogItem:newLogItem];
        }
        
        //next calculate the number of seat movements for the selfish method
        if((([[bathroomTrips objectAtIndex:i] isSittingPosition] == NO) && ([theToilet isToiletSeatDown]==YES)) ||
           (([[bathroomTrips objectAtIndex:i] isSittingPosition] == YES) && ([theToilet isToiletSeatDown]==NO))
           ){
            //someone is sitting in the bathroom
            
            //add the toilet seat movements to the log
            tseLogItem *newLogItem = [[tseLogItem alloc] init];
            [newLogItem setPerson:[bathroomTrips objectAtIndex:i]];
            [newLogItem setSeatMovement:YES];
            if ([theToilet isToiletSeatDown]==YES) {
                [newLogItem setSeatMovementDirectionUp:YES];
            } else {
                [newLogItem setSeatMovementDirectionUp:NO];
            }
            
            [selfishMethodLog addLogItem:newLogItem];
            
            //increment the total seat movements up by one
            [selfishMethodLog setNumSeatMovements:[selfishMethodLog numSeatMovements]+1];
            
            //toggle the toilet seat
            [theToilet setIsToiletSeatDown:![theToilet isToiletSeatDown]];
        }
        
    }
    
}

-(id)init
{
    if (self = [super init])
    {
        // Initialization code here
        
        //initialize variables
        days = 31;
        bathroomVisitsPerDay = 5;
        averagePercentSittingTrips = 20;
        numMales = 1;
        numFemales = 1;
        
        bathroomTrips = [[NSMutableArray alloc] init];
        courteousMethodLog = [[tseLog alloc] init];
        selfishMethodLog = [[tseLog alloc] init];
        
        theToilet = [[tseToilet alloc] init];
        [theToilet setIsToiletSeatDown:YES];
    }
    return self;
}

- (NSInteger) getNumCourteousSeatMovements{
    //return the number of seat movements based on the courteous method
    return [courteousMethodLog numSeatMovements];
}

- (NSInteger) getNumSelfishSeatMovements{
    //return the number of seat movements based on the selfish method
    return [selfishMethodLog numSeatMovements];
}

@end
