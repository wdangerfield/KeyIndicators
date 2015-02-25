//
//  ViewController.m
//  KeyIndicators
//
//  Created by  Westin Dangerfield on 2/23/15.
//  Copyright (c) 2015 dapp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *Numbers;
@property (weak, nonatomic) IBOutlet UITextField *Dates;
@property (weak, nonatomic) IBOutlet UITextField *Contacts;
@property (nonatomic, assign) id currentResponder;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.Numbers.delegate = self;
    self.Dates.delegate = self;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
     [self.view addGestureRecognizer:singleTap];
    
    CGFloat screenwidth = self.view.frame.size.width;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(getridofkeygboard)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Hide Keyboard" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 10.0, screenwidth, 40.0);
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"looks like it done disappear");
}

- (void)getridofkeygboard {
    [self.Numbers resignFirstResponder];
    [self.Dates resignFirstResponder];
    [self.Contacts resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    
    NSLog(@"I pressed enter");
    [textField resignFirstResponder];
    return YES;
}


//Implement the below delegate method:

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentResponder = textField;
}

//Implement resignOnTap:

- (void)resignOnTap:(id)iSender {
    [self.currentResponder resignFirstResponder];
}

@end
