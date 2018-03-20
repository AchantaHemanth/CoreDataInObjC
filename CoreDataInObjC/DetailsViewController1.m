//
//  DetailsViewController1.m
//  CoreDataInObjC
//
//  Created by Hemanth on 20/03/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

#import "DetailsViewController1.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface DetailsViewController1 ()
{
    AppDelegate * appDelegate;
    NSManagedObjectContext *context;
    ViewController * VC;
}
@end

@implementation DetailsViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstnameTF.text = [self.details1 valueForKey:@"firstname"];
    self.lastnameTF.text = [self.details1 valueForKey:@"lastname"];
    self.emailTF.text = [self.details1 valueForKey:@"email"];
    self.mobileTF.text = [self.details1 valueForKey:@"mobile"];
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

- (IBAction)updateBtnPressed:(id)sender
{
    if (self.details1)
    {
        
        // Update existing device
        [self.details1 setValue:self.firstnameTF.text forKey:@"firstname"];
        [self.details1 setValue:self.lastnameTF.text forKey:@"lastname"];
        [self.details1 setValue:self.emailTF.text forKey:@"email"];
        [self.details1 setValue:self.mobileTF.text forKey:@"mobile"];
        NSLog(@"Detail:%@",self.details1);
       // [self presentViewController:VC animated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSManagedObject * newDetail = [NSEntityDescription insertNewObjectForEntityForName:@"Details" inManagedObjectContext:context];
        [newDetail setValue:self.firstnameTF.text forKey:@"firstname"];
        [newDetail setValue:self.lastnameTF.text forKey:@"lastname"];
        [newDetail setValue:self.emailTF.text forKey:@"email"];
        [newDetail setValue:self.mobileTF.text forKey:@"mobile"];
        //NSLog(@"%@",newDetail);
        NSError * error = nil;
        if(![context save:&error])
        {
            NSLog(@"Can't Save! %@ %@",error,[error localizedDescription]);
        }
        //[self dismissViewControllerAnimated:YES completion:nil];
        //[self presentViewController:VC animated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }
      
}

@end
