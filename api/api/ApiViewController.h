//
//  ApiViewController.h
//  api
//
//  Created by Paulo McNally on 3/12/14.
//  Copyright (c) 2014 McNally Developers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApiViewController  : UIViewController<UIWebViewDelegate>{
    IBOutlet UIWebView *webView;
}

@property(nonatomic,strong) IBOutlet UIWebView *webView;
@property(nonatomic,strong) IBOutlet UINavigationBar *navigationBar;

@end
