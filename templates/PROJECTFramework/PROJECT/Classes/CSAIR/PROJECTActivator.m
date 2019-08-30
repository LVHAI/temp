//
//  PROJECTActivator.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "PROJECTActivator.h"

@implementation PROJECTActivator

///**
// 初始化插件
//
// @param bundle 由内核创建的插件运行实例
// */
//-(void)bundleInit:(id<AIRBundle>)bundle {
//
//}
//
///**
// 启动插件
//
// @param bundle 由内核创建的插件运行实例
// */
//-(void)bundleStart:(id<AIRBundle>)bundle {
//
//}
//
///**
// 停止插件
//
// @param bundle 由内核创建的插件运行实例
// */
//-(void)bundleStop:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundleSetup:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
//
//}
//
//-(void)bundleTearDown:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundleWillResignActive:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundleDidEnterBackground:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundleWillEnterForeground:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundleDidBecomeActive:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundleWillTerminate:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
//
//}
//
//-(void)bundleUnmount:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundleDidReceiveMemoryWaring:(id<AIRBundle>)bundle {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle didReceiveLocalNotification:(UILocalNotification *)notification {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle didUpdateUserActivity:(NSUserActivity *)userActivity {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle willContinueUserActivityWithType:(NSString *)userActivityType {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *))restorationHandler {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error {
//
//}
//
//-(void)bundleDidCustomEvent:(id<AIRBundle>)bundle eventType:(NSString *)eventType userInfo:(NSDictionary *)userInfo {
//
//}
//
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
//-(void)bundle:(id<AIRBundle>)bundle userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
//
//}
//
//-(void)bundle:(id<AIRBundle>)bundle userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler {
//
//}
//#endif

#pragma mark -
#pragma mark - bundle action handle
//
//-(AIRActivatorPriority)activatorPriority {
//    return AIRActivatorPriorityNormal;
//}
//
///**
// 拦截action请求，通过action中的URL使用自定义方式生成一个对象
//
// @param bundle 由内核创建的插件运行实例
// @param action 请求的URL封装成的action实体
// @return 返回自定义的对象
// */
//-(id)objectFromBundle:(id<AIRBundle>)bundle withAction:(AIRURLAction *)action {
//    return nil;
//}
//
///**
// 返回插件是否可以处理此URL的请求
// 这里也可以进行一些自定义的拦截，比如在manifest.xml中没有定义的，可以在这里隐式定义一些自己可以处理，但又不想公开的URL
//
// @param bundle 由内核创建的插件运行实例
// @param URL 要处理的URL
// @return YES or NO
// */
//-(BOOL)bundle:(id<AIRBundle>)bundle shouldHandleURL:(NSURL*)URL {
//    return YES;
//}

///**
// 当插件可以处理此URL时，你也可以改变原有URL的处理请求。
// 实现URL重定向，如果返回nil，默认不重定向，即使用原URL
//
// @param bundle 由内核创建的插件运行实例
// @param URL 要重定向的URL
// @return 重定向新的URL
// */
//-(NSURL*)bundle:(id<AIRBundle>)bundle URLToHandle:(NSURL*)URL {
//    return URL;
//}
//
///**
// 返回插件可以处理此的URL的请求的URLPattern，否则框架无法实例化对应的类和执行对应的方法
// 这里也可以进行一些自定义的拦截，比如在manifest.xml中没有定义的，可以在这里隐式定义一些自己可以处理，但又不想公开的URL
//
// @param bundle 由内核创建的插件运行实例
// @param URL 要处理的URL
// @return 对应URL匹配规则
// */
//-(id<AIRURLMapPattern>)bundle:(id<AIRBundle>)bundle URLPattern:(NSURL *)URL {
//    return nil;
//}

///**
// URL将要被object处理
//
// @param bundle 由内核创建的插件运行实例
// @param URL 要被处理的URL
// @param object 处理URL的对象
// */
//-(void)bundle:(id<AIRBundle>)bundle willHandleURL:(NSURL*)URL inObject:(id)object {
//
//}

@end
