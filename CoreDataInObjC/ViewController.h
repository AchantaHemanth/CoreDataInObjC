//
//  ViewController.h
//  CoreDataInObjC
//
//  Created by Hemanth on 17/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITextField *firstnameTF;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTF;
@property (strong, nonatomic) IBOutlet UITextField *emailTF;
@property (strong, nonatomic) IBOutlet UITextField *mobileTF;
@property (strong, nonatomic) IBOutlet UITableView *detailTV;

@property (strong, nonatomic) NSMutableArray * array;
- (IBAction)saveBtnPressed:(id)sender;
- (IBAction)refreshBtnPressed:(id)sender;



@end

