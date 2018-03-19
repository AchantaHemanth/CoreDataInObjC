//
//  CustomCell.h
//  CoreDataInObjC
//
//  Created by Hemanth on 19/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *firstnameLbl;
@property (strong, nonatomic) IBOutlet UILabel *lastnameLbl;

@property (strong, nonatomic) IBOutlet UILabel *emailLbl;
@property (strong, nonatomic) IBOutlet UILabel *mobileLbl;
@end
