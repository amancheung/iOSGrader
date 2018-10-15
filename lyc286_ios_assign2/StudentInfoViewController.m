//
//  StudentInfoViewController.m
//  
//
//  Created by Aman Cheung on 10/8/18.
//

#import "StudentInfoViewController.h"
#import "ViewController.h"

@interface StudentInfoViewController ()

@end

@implementation StudentInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Make sure UIView fits image
    [self.stuImage setContentMode:UIViewContentModeScaleAspectFit];
}

//Reset to home view with segue back to ViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"Starting segue %@", segue.identifier);
    ViewController *vc = (ViewController *)self.presentingViewController;
    [vc returnFromDetail];
}

- (IBAction)backButton:(id)sender {

}

#pragma mark - Navigation

@end
