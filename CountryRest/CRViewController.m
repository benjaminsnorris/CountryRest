//
//  CRViewController.m
//  CountryRest
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "CRViewController.h"
#import "CountryController.h"

@interface CRViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *capitalLabel;
@property (strong, nonatomic) IBOutlet UILabel *populationLabel;

@end

@implementation CRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)searchButton:(id)sender {
    [[CountryController sharedInstance] getCountriesWithName:self.textField.text withCompletion:^(NSArray *countries) {
        NSDictionary *country = countries.firstObject;
        self.countryNameLabel.text = country[@"name"];
        self.capitalLabel.text = country[@"capital"];
        NSNumber *population = country[@"population"];
        self.populationLabel.text = population.description;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
