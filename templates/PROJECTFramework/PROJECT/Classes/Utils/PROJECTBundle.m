//
//  PROJECTBundle.m
//  PROJECT
//
//  Created by lyh on 2018/3/28.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import "PROJECTBundle.h"

@implementation PROJECTBundle

+(NSBundle *)resourcesBundle {
    return [NSBundle bundleWithURL:[[NSBundle bundleForClass:self.class] URLForResource:@"PROJECTResources" withExtension:@"bundle"]];
}
    
@end
