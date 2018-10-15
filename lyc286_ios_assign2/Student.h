//
//  Student.h
//  
//
//  Created by Aman Cheung on 10/8/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

-(id) init;
//define properties for each student
@property NSString *name;
@property NSString *address;
@property float midterm_score;
@property float final_score;
@property int homework1_score;
@property int homework2_score;
@property int homework3_score;
@property NSString *imgAddr;

//Setters for properties
-(void) setName: (NSString *) name;
-(void) setAddress: (NSString *) address;
-(void) setMidterm_score:(float) midterm_score;
-(void) setFinal_score:(float) final_score;
-(void) setHomework1_score:(int) homework1_score;
-(void) setHomework2_score:(int) homework2_score;
-(void) setHomework3_score:(int) homework3_score;

//Methods to return information
//-(void) print_object;
//-(float) return_avg;

@end

NS_ASSUME_NONNULL_END
