//
//  ViewController.h
//  lyc286_ios_assign2
//
//  Created by Aman Cheung on 10/8/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Student;

@interface ViewController : UIViewController
@property NSMutableArray *stuArray;

-(BOOL) Add_Student_Valid:(NSString *)name
                  address:(NSString *)addr
                  finalIn:(NSString *)finalScore
                midTermIn:(NSString *)midTermScore
                    hw1In:(NSString *)hw1Score
                    hw2In:(NSString *)hw2Score
                    hw3In:(NSString *)hw3Score;
-(void) returnFromDetail;

@end

