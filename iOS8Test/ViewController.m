//
//  ViewController.m
//  iOS8Test
//
//  Created by Gunnar Herzog on 26/06/14.
//  Copyright (c) 2014 KF Interactive. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@end


@implementation ViewController

- (IBAction)showAlert:(id)sender
{
    [self showAlertWithStyle:UIAlertControllerStyleAlert];
}


- (IBAction)showActionSheet:(id)sender
{
    [self showAlertWithStyle:UIAlertControllerStyleActionSheet];
}


- (void)showAlertWithStyle:(UIAlertControllerStyle)style
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Test" message:@"huhu" preferredStyle:style];
    [alert addAction:[UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        NSLog(@"Default tapped");
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
    {
        NSLog(@"Cancel tapped");
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action)
    {
        NSLog(@"Destructive tapped");
    }]];

    alert.view.layer.cornerRadius = 50;
    alert.view.tintColor = [UIColor greenColor];

    [self presentViewController:alert animated:YES completion:nil];
}

@end
