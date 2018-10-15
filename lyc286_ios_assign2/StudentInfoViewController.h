//
//  StudentInfoViewController.h
//  
//
//  Created by Aman Cheung on 10/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StudentInfoViewController : UIViewController

//Properties to for ViewController to pass in data
@property (weak, nonatomic) IBOutlet UITextField *nameInfo;
@property (weak, nonatomic) IBOutlet UITextField *addrInfo;
@property (weak, nonatomic) IBOutlet UIImageView *stuImage;



@end



NS_ASSUME_NONNULL_END
