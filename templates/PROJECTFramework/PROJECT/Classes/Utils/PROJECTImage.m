//
//  PROJECTImage.m
//  PROJECT
//
//  Created by lyh on 2018/3/28.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import "PROJECTImage.h"
#import "PROJECTBundle.h"

@implementation PROJECTImage

+(UIImage *)imageNamed:(NSString *)imageName {
    return [UIImage imageNamed:imageName inBundle:[PROJECTBundle resourcesBundle] compatibleWithTraitCollection:nil];
}
    
@end
