//
//  ViewController.m
//  InsecureCryptographyDecryptor
//
//  Created by Prateek Gianchandani on 1/14/14.
//  Copyright (c) 2014 HighAltitudeHacks.com. All rights reserved.
//

#import "ViewController.h"
#import "RNDecryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self decryptPassword];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)decryptPassword {
      NSString *dataPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"/secret-data"];
      NSError *error;
      NSData *encryptedData = [NSData dataWithContentsOfFile:dataPath];
      NSData *decryptedData = [RNDecryptor decryptData:encryptedData
                                        withPassword:@"Secret-Key"
                                               error:&error];
     NSString *password = [[NSString alloc] initWithData:decryptedData
                                               encoding:NSUTF8StringEncoding];
    
    
    UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 160.0, 200.0, 100.0)];
    [self.view addSubview:newLabel];
    [newLabel setText:password];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
