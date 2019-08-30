//
//  PROJECTTests.m
//  PROJECTTests
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CSAIR/CSAIR-Headers.h>

@interface PROJECTTests : XCTestCase

@end

@implementation PROJECTTests

- (void)setUp {
    [super setUp];
    
    [CSAIR loadFrameworkWithManifest:[[NSBundle bundleForClass:self.class] pathForResource:@"PROJECTTests.bundle/manifest" ofType:nil]
                              window:[UIWindow new]
                      rootController:nil
                                 env:AIREnvDev];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
