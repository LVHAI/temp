//
//  UIView+PROJECTNib.m
//  PROJECT
//
//  Created by lyh on 2018/3/28.
//  Copyright © 2018年 lyh. All rights reserved.
//

#import "UIView+PROJECTNib.h"

@implementation UIView (PROJECTNib)

+(UINib *)PROJECTNib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[PROJECTBundle resourcesBundle]];
}
    
+(instancetype)loadFromPROJECTNib {
    NSString* nibName = NSStringFromClass([self class]);
    NSArray* elements = [[PROJECTBundle resourcesBundle] loadNibNamed:nibName owner:nil options:nil];
    for (id anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            return anObject;
        }
    }
    return nil;
}
    
@end
