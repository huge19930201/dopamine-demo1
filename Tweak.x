#import <UIKit/UIKit.h>

// 静态变量，防止弹窗用的窗口被系统释放
static UIWindow *gAlertWindow = nil;

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;

    // 设备解锁后延迟 3 秒弹出一个提示框，证明插件已成功加载
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController
            alertControllerWithTitle:@"编译成功"
                             message:@"你的多巴胺插件已经成功加载并运行！"
                      preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"好的"
                                                  style:UIAlertActionStyleDefault
                                                handler:nil]];

        // 找个可用的窗口场景来承载弹窗
        UIWindowScene *scene = nil;
        for (UIScene *s in [UIApplication sharedApplication].connectedScenes) {
            if ([s isKindOfClass:[UIWindowScene class]]) {
                scene = (UIWindowScene *)s;
                break;
            }
        }
        if (!scene) return;

        gAlertWindow = [[UIWindow alloc] initWithWindowScene:scene];
        gAlertWindow.rootViewController = [UIViewController new];
        gAlertWindow.windowLevel = UIWindowLevelAlert + 1;
        [gAlertWindow makeKeyAndVisible];
        [gAlertWindow.rootViewController presentViewController:alert
                                                      animated:YES
                                                    completion:nil];
    });
}

%end
