//
//  ViewController.m
//  TZWB
//
//  Created by tangze on 15/7/6.
//  Copyright (c) 2015年 tangze. All rights reserved.
//

#import "ViewController.h"
#import "UMSocialSnsPlatformManager.h"
#import "UMSocialSnsService.h"
#import "UMSocialSnsData.h"
#import "UMSocialDataService.h"
#import "UMSocialControllerService.h"
#import "UMSocialData.h"
#import "UMSocialAccountManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.


    NSLog(@"qqqqq");

}
- (IBAction)buttonAction:(id)sender {
    
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
             NSString *loginCode = response.data[@"uid"];
            NSLog(@"username is %@, uid is %@, token is %@ url is %@,loginCode=%@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL,loginCode);
            
        }});

}
- (IBAction)bu:(id)sender {
    
    
    [[UMSocialDataService defaultDataService] requestUnOauthWithType:UMShareToSina  completion:^(UMSocialResponseEntity *response){
        NSLog(@"response is %@",response);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
