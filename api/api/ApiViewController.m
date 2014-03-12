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
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"_toc" withExtension:@"html" ];
    NSString *html = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [webView loadHTMLString:html baseURL:baseUrl];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
