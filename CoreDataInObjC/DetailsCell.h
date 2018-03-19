//
//  DetailsCell.h
//  CoreDataInObjC
//
//  Created by Hemanth on 19/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *firstnameTF;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTF;
@property (strong, nonatomic) IBOutlet UITextField *emailTF;
@property (strong, nonatomic) IBOutlet UITextField *mobileTF;

@end
