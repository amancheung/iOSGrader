//
//  ViewController.m
//  lyc286_ios_assign2
//
//  Created by Aman Cheung on 10/8/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "StudentInfoViewController.h"
#import "Student.h"
@interface ViewController ()
//Link UITextFields, Labels and Buttons
@property int count;
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *addrLabel;
@property (weak, nonatomic) IBOutlet UITextField *midTermLabel;
@property (weak, nonatomic) IBOutlet UITextField *finalLabel;
@property (weak, nonatomic) IBOutlet UITextField *hw1Label;
@property (weak, nonatomic) IBOutlet UITextField *hw2Label;
@property (weak, nonatomic) IBOutlet UITextField *hw3Label;
@property (weak, nonatomic) IBOutlet UIButton *nxtStudent;
@property (weak, nonatomic) IBOutlet UIButton *addStudent;
@property (weak, nonatomic) IBOutlet UIButton *prevBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedButton;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end

@implementation ViewController

//Method to go back to home view from student info
-(void) returnFromDetail{
    [self.segmentedButton setSelectedSegmentIndex:0];
}

//Method to update/scroll through student array forward
- (IBAction)nextStudent:(id)sender {
    //Save new variables to array if change
    Student *currStu = [self.stuArray objectAtIndex:self.count];
    currStu.midterm_score = [self.midTermLabel.text floatValue];
    currStu.final_score = [self.finalLabel.text floatValue];
    currStu.homework1_score = [self.hw1Label.text integerValue];
    currStu.homework2_score = [self.hw2Label.text integerValue];
    currStu.homework3_score = [self.hw3Label.text integerValue];
    NSLog(@"Name: %@ Final Score: %f", currStu.name, currStu.final_score);
    [self.stuArray replaceObjectAtIndex:self.count withObject:currStu];
    //Scroll through students
    self.count++;
    //Enable prevButton once next is clicked
    [self.prevBtn setEnabled:YES];
    //Disable nextButton once end of array is reached
    if (self.count>=[self.stuArray count]) {
        [self.nextBtn setEnabled:NO];
        self.count = [self.stuArray count]-1;
    }
    NSLog(@"Count: %d", self.count);
    Student *nextStu = [self.stuArray objectAtIndex:self.count];
    
    //Display new student info.
    self.nameLabel.text= nextStu.name;
    self.addrLabel.text = nextStu.address;
    self.midTermLabel.text = [NSString stringWithFormat: @"%.1f", nextStu.midterm_score];
    self.finalLabel.text = [NSString stringWithFormat: @"%.1f", nextStu.final_score];
    self.hw1Label.text = [NSString stringWithFormat: @"%d", nextStu.homework1_score];
    self.hw2Label.text = [NSString stringWithFormat: @"%d", nextStu.homework2_score];
    self.hw3Label.text = [NSString stringWithFormat: @"%d", nextStu.homework3_score];
    
}

//Method to update/scroll through student array backward
- (IBAction)prevStudent:(id)sender {
    //Save new variables to array if change
    Student *currStu = [self.stuArray objectAtIndex:self.count];
    currStu.midterm_score = [self.midTermLabel.text floatValue];
    currStu.final_score = [self.finalLabel.text floatValue];
    currStu.homework1_score = [self.hw1Label.text integerValue];
    currStu.homework2_score = [self.hw2Label.text integerValue];
    currStu.homework3_score = [self.hw3Label.text integerValue];
    NSLog(@"Name: %@ Final Score: %f", currStu.name, currStu.final_score);
    [self.stuArray replaceObjectAtIndex:self.count withObject:currStu];
    //Scroll through students
    self.count--;
    //Enable next button once prev is clicked
    [self.nextBtn setEnabled:YES];
    //Disable prevButton once end of array is reached
    if (self.count<0) {
        [self.prevBtn setEnabled:NO];
        self.count = 0;
    }
    NSLog(@"Count: %d", self.count);
    Student *nextStu = [self.stuArray objectAtIndex:self.count];
    //Display new student info.
    self.nameLabel.text= nextStu.name;
    self.addrLabel.text = nextStu.address;
    self.midTermLabel.text = [NSString stringWithFormat: @"%.1f", nextStu.midterm_score];
    self.finalLabel.text =[NSString stringWithFormat: @"%.1f", nextStu.final_score];
    self.hw1Label.text = [NSString stringWithFormat: @"%d", nextStu.homework1_score];
    self.hw2Label.text = [NSString stringWithFormat: @"%d", nextStu.homework2_score];
    self.hw3Label.text = [NSString stringWithFormat: @"%d", nextStu.homework3_score];
    
}

//Method to check if information is complete
- (BOOL) Add_Student_Valid:(NSString *)name address:(NSString *)addr finalIn:(NSString *)finalScore midTermIn:(NSString *)midTermScore hw1In:(NSString *)hw1Score hw2In:(NSString *)hw2Score hw3In:(NSString *)hw3Score {
    if ([name isEqualToString:@""]) {
        NSLog(@"Name is blank");
        return NO;
    } else if ([addr isEqualToString:@""]) {
        NSLog(@"Address is blank");
        return NO;
    } else if ([finalScore isEqualToString:@""]){
        NSLog(@"Final score is blank");
        return NO;
    } else if ([midTermScore isEqualToString:@""]) {
        NSLog(@"Midterm score is blank");
        return NO;
    } else if ([hw1Score isEqualToString:@""]) {
        NSLog(@"Homework 1 score is blank");
        return NO;
    } else if ([hw2Score isEqualToString:@""]) {
        NSLog(@"Homework 2 score is blank");
        return NO;
    } else if ([hw3Score isEqualToString:@""]) {
        NSLog(@"Homework 3 score is blank");
        return NO;
    }
    return YES;
}
- (IBAction)addStudent:(id)sender {
    //Save values in text fields into array
    //Add student if information is complete
    if ([self Add_Student_Valid:self.nameLabel.text address:self.addrLabel.text finalIn:self.finalLabel.text midTermIn:self.midTermLabel.text hw1In:self.hw1Label.text hw2In:self.hw2Label.text hw3In:self.hw3Label.text]) {
        NSLog(@"Student info complete - can be added");
        Student *newStu = [[Student new] init];
        newStu.name = self.nameLabel.text;
        newStu.address = self.addrLabel.text;
        newStu.midterm_score = [self.midTermLabel.text floatValue];
        newStu.final_score = [self.finalLabel.text floatValue];
        newStu.homework1_score = [self.hw1Label.text integerValue];
        newStu.homework2_score = [self.hw2Label.text integerValue];
        newStu.homework3_score = [self.hw3Label.text integerValue];
        [newStu setImgAddr:@"imageNotAvailable"]; //Set image of new student to a preset undefined image
        [self.stuArray addObject:newStu];
        
        //Enable nextButton once new student is added
        [self.nextBtn setEnabled:YES];
        [self.errorLabel setText:[NSString stringWithFormat:@"%@ added", newStu.name]];
    } else {
        //Display error message if information is complete
        [self.errorLabel setText:@"Student not added, information incomplete"];
    }
}

//Function that switch views per segment controller
- (IBAction)segmentSelect:(id)sender {
    UISegmentedControl *seg = (UISegmentedControl *) sender;
    int select = seg.selectedSegmentIndex;
    //Update info view
    if (select==0) {
        //Disable unused buttons and enable hidden buttons
        [self.addStudent setAlpha:0];
        [self.errorLabel setAlpha:0];
        [self.prevBtn setAlpha:1];
        [self.nextBtn setAlpha:1];
        
        Student *currStu = [_stuArray objectAtIndex:self.count];
        self.nameLabel.text= currStu.name;
        self.addrLabel.text = currStu.address;
        self.midTermLabel.text = [NSString stringWithFormat: @"%.1f", currStu.midterm_score];
        self.finalLabel.text =[NSString stringWithFormat: @"%.1f", currStu.final_score];
        self.hw1Label.text = [NSString stringWithFormat: @"%d", currStu.homework1_score];
        self.hw2Label.text = [NSString stringWithFormat: @"%d", currStu.homework2_score];
        self.hw3Label.text = [NSString stringWithFormat: @"%d", currStu.homework3_score];
        
    } else if (select==1) { //View info view
        //Segue to different view controller
        StudentInfoViewController *si =  [self.storyboard instantiateViewControllerWithIdentifier:@"studentInfoView"];
        [self showViewController:si sender:NULL];
        Student *currStu = [_stuArray objectAtIndex:self.count];
        [si.nameInfo setText:currStu.name];
        [si.addrInfo setText:currStu.address];
        [si.stuImage setImage:[UIImage imageNamed:currStu.imgAddr]];

    } else { //Add student view
        //Blank out UITextView to prevent confusion
        self.nameLabel.text = @"";
        self.addrLabel.text = @"";
        self.midTermLabel.text = @"";
        self.finalLabel.text = @"";
        self.hw1Label.text = @"";
        self.hw2Label.text = @"";
        self.hw3Label.text = @"";
        //Disable unused buttons & enable hidden buttons
        [self.addStudent setAlpha:1];
        [self.errorLabel setAlpha:1];
        [self.errorLabel setText:@""];
        [self.prevBtn setAlpha:0];
        [self.nextBtn setAlpha:0];
    }
}

-(IBAction)backHome:(UIStoryboardSegue *    )segue {
    NSLog(@"backHome: in ViewController");
}  // end backHome


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.addStudent setAlpha:0];
    [self.errorLabel setAlpha:0];
    [self.errorLabel setAdjustsFontSizeToFitWidth:YES];
    [self.errorLabel setText:@""];
    //Initialize student array
    self.stuArray = [[NSMutableArray new] init];
    Student *newStu = [[Student new] init];
    
    //Initialize with having two students
    [newStu setName: @"Joey Martin"];
    [newStu setAddress: @"California"];
    [newStu setMidterm_score: 85.4];
    [newStu setFinal_score: 90.1];
    [newStu setHomework1_score: 5];
    [newStu setHomework2_score: 6];
    [newStu setHomework3_score: 7];
    [newStu setImgAddr:@"joey_martin.jpg"]; //Predefine image
    
    [self.stuArray addObject:newStu];
    newStu = [[Student new] init];
    [newStu setName: @"Mary Jones"];
    [newStu setAddress: @"New York"];
    [newStu setMidterm_score: 75.4];
    [newStu setFinal_score: 80.1];
    [newStu setHomework1_score: 7];
    [newStu setHomework2_score: 8];
    [newStu setHomework3_score: 9];
    [newStu setImgAddr:@"mary_jones.jpg"]; //Predefine image
    [self.stuArray addObject:newStu];
    
    self.count=0;
    
    //Display initialized student info
    Student *currStu = [self.stuArray objectAtIndex:self.count];
    self.nameLabel.text= currStu.name;
    self.addrLabel.text = currStu.address;
    self.midTermLabel.text = [NSString stringWithFormat: @"%.1f", currStu.midterm_score];
    self.finalLabel.text =[NSString stringWithFormat: @"%.1f", currStu.final_score];
    self.hw1Label.text = [NSString stringWithFormat: @"%d", currStu.homework1_score];
    self.hw2Label.text = [NSString stringWithFormat: @"%d", currStu.homework2_score];
    self.hw3Label.text = [NSString stringWithFormat: @"%d", currStu.homework3_score];
}


@end
