//
//  tseViewController.m
//  ToiletSeatEtiquette2
//
//  Created by Patrick Rauland on 9/7/12.
//  Copyright (c) 2012 Patrick Rauland. All rights reserved.
//

#import "tseViewController.h"
#import "tseSimulation.h"

@interface tseViewController ()

@end

@implementation tseViewController
@synthesize numMalesStepper;
@synthesize numFemalesStepper;
@synthesize numBathroomTripsPerDayStepper;

@synthesize numMalesLabel;
@synthesize numFemalesLabel;
@synthesize numBathroomTripsPerDay;
@synthesize courteousMethodResults;
@synthesize courteousMethodResultsLabel;
@synthesize selfishMethodResults;
@synthesize selfishMethodResultsLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set the stepper labels according to the stepper value
    [numMalesLabel setText:[NSString stringWithFormat:@"%d", (int)[numMalesStepper value]]];
    [numFemalesLabel setText:[NSString stringWithFormat:@"%d", (int)[numFemalesStepper value]]];
    [numBathroomTripsPerDay setText:[NSString stringWithFormat:@"%d", (int)[numBathroomTripsPerDayStepper value]]];
    
}

- (void)viewDidUnload
{
    [self setNumMalesLabel:nil];
    [self setNumFemalesLabel:nil];
    [self setNumBathroomTripsPerDay:nil];
    [self setNumMalesStepper:nil];
    [self setNumFemalesStepper:nil];
    [self setNumBathroomTripsPerDayStepper:nil];
    [self setCourteousMethodResults:nil];
    [self setCourteousMethodResultsLabel:nil];
    [self setSelfishMethodResults:nil];
    [self setSelfishMethodResultsLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)numMalesStepper:(UIStepper *)sender {
    //update the label accordingly
    double value = [sender value];
    [numMalesLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}

- (IBAction)numFemalesStepper:(UIStepper *)sender {
    double value = [sender value];
    [numFemalesLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}

- (IBAction)numBathroomTripsPerDayStepper:(UIStepper *)sender {
    double value = [sender value];
    [numBathroomTripsPerDay setText:[NSString stringWithFormat:@"%d", (int)value]];
}

- (IBAction)btnRun:(UIButton *)sender {
    //initialize the simulation
    tseSimulation *theSimulation = [[tseSimulation alloc] init];
    
    //configure the variables
    [theSimulation setNumMales:[numMalesStepper value]];
    [theSimulation setNumFemales:[numFemalesStepper value]];
    [theSimulation setBathroomVisitsPerDay:[numBathroomTripsPerDayStepper value]];
    
    //run the simulation
    [theSimulation simulate];
    
    //print the results
    UIFont *font = [UIFont boldSystemFontOfSize:60];
    [courteousMethodResultsLabel setText:[NSString stringWithFormat:@"Courteous Method Seat Movements"]];
    [courteousMethodResults setText:[NSString stringWithFormat:@"%d", [theSimulation getNumCourteousSeatMovements]]];
    [courteousMethodResults setFont:font];
    [selfishMethodResultsLabel setText:[NSString stringWithFormat:@"Selfish Method Seat Movements"]];
    [selfishMethodResults setText:[NSString stringWithFormat:@"%d", [theSimulation getNumSelfishSeatMovements]]];
    [selfishMethodResults setFont:font];
     
}
@end
