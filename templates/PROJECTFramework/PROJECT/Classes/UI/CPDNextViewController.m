//
//  CPDNextViewController.m
//  PROJECT_Example
//
//  Created by lyh on 2018/3/7.
//  Copyright © 2018年 PROJECT_OWNER. All rights reserved.
//

#import "CPDNextViewController.h"
#import <CSAIR/CSAIR-Headers.h>

@interface CPDNextViewController ()
@property (nonatomic) NSInteger page;
@end

@implementation CPDNextViewController

-(instancetype)initWithPage:(NSInteger)page {
    if (self = [super init]) {
        _page = page;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [NSString stringWithFormat:@"第%ld页", _page];
    
    self.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1.0];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"点击下一页" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)next {
    
    [CSAIR openURL:[NSString stringWithFormat:@"PROJECT://next/page/%ld", _page+1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
