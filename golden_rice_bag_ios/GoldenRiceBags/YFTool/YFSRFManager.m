//
//  YFSRFManager.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/6/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFSRFManager.h"
#import "YFLoginRequest.h"
@implementation YFSRFManager
+(void)YFSrfSuccess:(void (^)(id json))success failure:(void (^)(NSError *error))failure
{
    [YFLoginRequest YFSrfSuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSArray *data=[json objectForKey:@"data"];
            if (data.count>0) {
                NSDictionary *srf=[data objectAtIndex:0];
                NSString *srfString=[srf objectForKey:@"srf"];
             
                success(srfString);
            }
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
            NSLog(@" error == %@",error);
            
            NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
            NSDictionary *errorDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"Login error == %@",errorDict);
            
            [YFProgressHUD showInfoWithStatus:[errorDict objectForKey:@"error_description"]];
        }
        
    }];
}
@end
