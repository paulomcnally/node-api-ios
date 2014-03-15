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
@synthesize webView,navigationBar,navigationItem;

- (void)viewDidLoad
{
    
    self.webView.delegate = self;
    
    // StatusBar apareance
    [self setNeedsStatusBarAppearanceUpdate];
    
    // Init NavigationBar
    [self navigationBarInit];
    
    // Load Home page
    [self loadHome];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/**
 *
 * Initialize NavitationBar styling
 */

- (void)navigationBarInit{
    
    // StatusBar background
    self.view.backgroundColor = [UIColor blackColor];
    
    // NavigationBar background color
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    
    // Change back text color
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // Change title text color
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
    
    
    
}

/**
 *
 * On Page finish load
 * - Set title
 * - Show or Hide back button
 */
- (void)webViewDidFinishLoad:(UIWebView *)webViewInstance{
    
    NSString *title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    self.navigationItem.title = title;
    
    // Show or Hide back button
    NSString *currentURL = [self.webView stringByEvaluatingJavaScriptFromString:@"window.location.href"];
    
    NSArray* pathSplit = [currentURL componentsSeparatedByString: @"/"];
    NSInteger length = [pathSplit count];
    NSString *fileName = [pathSplit objectAtIndex: length-1];
    
    if ([fileName isEqualToString:@"_toc.html"]) {
        self.navigationItem.leftBarButtonItem = nil;
    }
    else{
        UIBarButtonItem *tmpButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        self.navigationItem.leftBarButtonItem = tmpButtonItem;
    }
    
}

/**
 *
 * Reload home page
 */
- (void)backAction{
    // Load index page
    [self loadHome];
}

/**
 *
 * Load home page (_toc.html)
 */
- (void)loadHome{
    
    // WebView
    //self.webView.delegate = nil;
    webView.delegate = self; // require to call webViewDidFinishLoad
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"_toc" ofType:@"html" inDirectory:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:filePath];
    NSString *htmlstring=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [webView loadHTMLString:htmlstring baseURL:baseURL];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
