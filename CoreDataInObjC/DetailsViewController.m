//
//  DetailsViewController.m
//  CoreDataInObjC
//
//  Created by Hemanth on 19/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.detailArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.detailArray.count;
}
- ( UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:( NSIndexPath *)indexPath
{
    DetailsCell *detailCell = [self.detailTV dequeueReusableCellWithIdentifier:@"DetailsCell"];
    if (detailCell == nil)
    {
        detailCell= [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DetailsCell class]) owner:self options:0] objectAtIndex:0];
    }
    detailCell.firstnameTF.text = self.detailArray[indexPath.row];
     detailCell.lastnameTF.text = self.detailArray[indexPath.row];
     detailCell.emailTF.text = self.detailArray[indexPath.row];
     detailCell.mobileTF.text = self.detailArray[indexPath.row];
    
    return detailCell;
}


@end
