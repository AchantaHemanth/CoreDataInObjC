//
//  DetailsViewController.h
//  CoreDataInObjC
//
//  Created by Hemanth on 19/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsCell.h"

@interface DetailsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *detailTV;
@property (strong, nonatomic) NSMutableArray * detailArray;
@end
