//
//  tseViewController.h
//  ToiletSeatEtiquette2
//
//  Created by Patrick Rauland on 9/7/12.
//  Copyright (c) 2012 Patrick Rauland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tseViewController : UIViewController

//labels
@property (weak, nonatomic) IBOutlet UILabel *numMalesLabel;
@property (weak, nonatomic) IBOutlet UILabel *numFemalesLabel;
@property (weak, nonatomic) IBOutlet UILabel *numBathroomTripsPerDay;
@property (weak, nonatomic) IBOutlet UILabel *courteousMethodResults;
@property (weak, nonatomic) IBOutlet UILabel *courteousMethodResultsLabel;
@property (weak, nonatomic) IBOutlet UILabel *selfishMethodResults;
@property (weak, nonatomic) IBOutlet UILabel *selfishMethodResultsLabel;

//steppers
@property (weak, nonatomic) IBOutlet UIStepper *numMalesStepper;
@property (weak, nonatomic) IBOutlet UIStepper *numFemalesStepper;
@property (weak, nonatomic) IBOutlet UIStepper *numBathroomTripsPerDayStepper;

//stepper actions
- (IBAction)numMalesStepper:(id)sender;
- (IBAction)numFemalesStepper:(id)sender;
- (IBAction)numBathroomTripsPerDayStepper:(id)sender;


//buttons
- (IBAction)btnRun:(id)sender;

@end
