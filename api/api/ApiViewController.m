//
//  ApiViewController.m
//  api
//
//  Created by Paulo McNally on 3/12/14.
//  Copyright (c) 2014 McNally Developers. All rights reserved.
//

#import "ApiViewController.h"

@interface ApiViewController ()

@end

@implementation ApiViewController
@synthesize webView;

- (void)viewDidLoad
{

    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"_toc" ofType:@"html" inDirectory:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:filePath];
    NSString *htmlstring=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlstring baseURL:baseURL];

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
