//
//  MyActivity.m
//  ActivityDemo

#import "MyActivity.h"

@implementation MyActivity

-(instancetype)initWithImage:(UIImage *)shareImage atURL:(NSString *)URL atTitle:(NSString *)title atShareContentArray:(NSArray *)shareContentArray
{
    if(self = [super init]){
        _shareImage = shareImage;
        _URL = URL;
        _title = title;
        _getShareArray = [[NSArray alloc]initWithArray:shareContentArray];
    }
    return self;
}

+(UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}

-(NSString *)activityType
{
    return _title;
}

-(NSString *)activityTitle
{
    return _title;
}

-(UIImage *)activityImage
{
    return _shareImage;
}

// 设置是否显示分享按钮
-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    return YES;
}

// 预处理分享数据
- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
    // 解析分享数据时调用，可以进行一定的处理
}

// 点击自定义分享按钮时调用，跳转到自定义的视图控制器
- (UIViewController *)activityViewController
{
    return nil;
}

// 执行分享
-(void)performActivity
{
    if(nil == _title) {
        return;
    }
    
    NSLog(@"要分享的内容-----%@",_getShareArray);
    NSLog(@"分享的类型------ %@",_title);
    
    //调用人人的sdk
    if([_title isEqualToString:@"share Renren"]){
        NSLog(@"---调用   renren");
        
    }else if([_title isEqualToString:@"share Sina"]){
        NSLog(@"---调用新浪sdk");
    }
}

// 完成分享
- (void)activityDidFinish:(BOOL)completed {
    
    // 分享视图控制器退出时调用
}

@end
