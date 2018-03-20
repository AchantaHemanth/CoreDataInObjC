//
//  DetailsViewController1.h
//  CoreDataInObjC
//
//  Created by Hemanth on 20/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface DetailsViewController1 : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstnameTF;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTF;
@property (strong, nonatomic) IBOutlet UITextField *emailTF;
@property (strong, nonatomic) IBOutlet UITextField *mobileTF;

@property (strong, nonatomic) NSManagedObject * details1;
- (IBAction)updateBtnPressed:(id)sender;
@end
