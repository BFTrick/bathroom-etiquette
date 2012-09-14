//
//  tseLogItem.h
//  ToiletSeatEtiquette2
//
//  Created by Patrick Rauland on 9/8/12.
//  Copyright (c) 2012 Patrick Rauland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tsePerson.h"

@interface tseLogItem : NSObject

@property (strong, nonatomic) tsePerson *person;
@property (readwrite) BOOL seatMovement;
@property (readwrite) BOOL seatMovementDirectionUp;

@end
