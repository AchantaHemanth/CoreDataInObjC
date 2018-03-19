//
//  ViewController.m
//  CoreDataInObjC
//
//  Created by Hemanth on 17/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import "CustomCell.h"
#define     isiPhone4()     [UIScreen mainScreen].bounds.size.height == 480
#define     isiPhone5()     [UIScreen mainScreen].bounds.size.height == 568
#define     isiPhone6()     [UIScreen mainScreen].bounds.size.height == 667
#define     isiPhone6Plus() [UIScreen mainScreen].bounds.size.height == 736

@interface ViewController ()
{
    AppDelegate * appDelegate;
    NSManagedObjectContext *context;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
}

- (IBAction)saveBtnPressed:(id)sender
{
    
    NSManagedObject *entity = [NSEntityDescription insertNewObjectForEntityForName:@"Details" inManagedObjectContext:context];
    [entity setValue:self.firstnameTF.text forKey:@"firstname"];
    [entity setValue:self.lastnameTF.text forKey:@"lastname"];
    [entity setValue:self.emailTF.text forKey:@"email"];
    [entity setValue:self.mobileTF.text forKey:@"mobile"];
    [appDelegate saveContext];
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Details"];
    self.array = [[context executeFetchRequest:request error:nil]mutableCopy];
    [self.detailTV reloadData];
    self.firstnameTF.text = @"";
    self.lastnameTF.text = @"";
    self.mobileTF.text = @"";
    }

- (IBAction)refreshBtnPressed:(id)sender
{
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Details"];
    //NSArray * array = [context executeFetchRequest:request error:nil];
    self.array = [[context executeFetchRequest:request error:nil]mutableCopy];
    [self.detailTV reloadData];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Details"];
    //NSArray * array = [context executeFetchRequest:request error:nil];
    self.array = [[context executeFetchRequest:request error:nil]mutableCopy];
    [self.detailTV reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return self.array.count;
}
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSManagedObject * detail = [self.array objectAtIndex:indexPath.row];
    [cell.firstnameLbl setText:[NSString stringWithFormat:@"%@", [detail valueForKey:@"firstname"]]];
    [cell.lastnameLbl setText:[NSString stringWithFormat:@"%@", [detail valueForKey:@"lastname"]]];
    [cell.emailLbl setText:[NSString stringWithFormat:@"%@", [detail valueForKey:@"email"]]];
    [cell.mobileLbl setText:[NSString stringWithFormat:@"%@", [detail valueForKey:@"mobile"]]];
    return cell;

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [context deleteObject:[self.array objectAtIndex:indexPath.row]];
        NSError * error = nil;
        if(![context save:&error])
        {
            NSLog(@"Can't Delete! %@ %@", error,[error localizedDescription]);
            return;
        }
        [self.array removeObjectAtIndex:indexPath.row];
        [self.detailTV deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(isiPhone5())
    {
        return 120;
    } else if (isiPhone6())
    {
        return 70;
    }
    else
    {
        return 80;
    }
}
 -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController * dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    dvc.detailArray = self.array[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
}





@end
