//
//  Student.m
//  
//
//  Created by Aman Cheung on 10/8/18.
//

#import "Student.h"

@implementation Student
-(id) init{
    if (self=[super init]){
        
    }
    return self;
}

//Return student information
/*-(void) print_object{
    NSLog(@"Student: %@\nAddress: %@\nMidterm score: %.1f\nFinal score: %.1f\nHomework 1 score: %d\nHomework 2 score: %d\nHomework 3 score: %d",_name,_address,_midterm_score,_final_score,_homework1_score,_homework2_score,_homework3_score);
}*/

//Return student average base on weights
/*-(float) return_avg{
    float midterm_weight = 30*(_midterm_score/100);
    float final_weight = 40*(_final_score/100);
    float homework_weight = 30*((_homework3_score+_homework2_score+_homework1_score)/30);
    return midterm_weight+final_weight+homework_weight;
}*/

@end
