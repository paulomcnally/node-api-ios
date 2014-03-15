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
@synthesize webView,navigationBar;

- (void)viewDidLoad
{
    
    
    // NavigationBar background color
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    // NavigationBar Title Text Color
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor],
      NSForegroundColorAttributeName,
      [UIColor whiteColor],
      NSForegroundColorAttributeName,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
      NSForegroundColorAttributeName,
      [UIFont fontWithName:@"Arial-Bold" size:0.0],
      NSFontAttributeName,
      nil]];
    
    

    // WebView
    webView.delegate = self; // require to call webViewDidFinishLoad
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"_toc" ofType:@"html" inDirectory:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:filePath];
    NSString *htmlstring=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlstring baseURL:baseURL];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



// Handle web title
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    self.navigationBar.topItem.title = title;
    
    //[[UINavigationBar appearance] setTitle: title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
