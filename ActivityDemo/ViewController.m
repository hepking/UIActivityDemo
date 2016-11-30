//
//  ViewController.m
//  ActivityDemo
//

#import "ViewController.h"
#import "SharedItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    bt.backgroundColor = [UIColor orangeColor];
    bt.layer.cornerRadius = 50;
    [self.view addSubview:bt];
    [bt setTitle:@"分享" forState:UIControlStateNormal];
    bt.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [bt addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];

}

-(void)share:(id)sender
{
    // 实现微信发布多图的功能
    // 图片网址数组
    /*NSArray *array_photo = @[@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt2fbZm38Zct4DH92p-ez7-fXt.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocd24Y6jK8uQA8-8y-47H6vRe7.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneiocdd94h6ld4kQJh8PcpjGSkORS.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneioccpacV1LVg2AfG9fbYl8zN1So.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt0haf1zwepSkxx9okI0W34t05.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85",@"http://img.meifajia.com/o1aneipt09eCl5bqQp4ifbQdTHlKIJfq.jpg?imageView2/1/w/360/h/480/q/85"];
    
    
    NSMutableArray *activityItems = [[NSMutableArray alloc]init];
    for (int i = 0; i <8 && i<array_photo.count; i++)
    {
        NSString *URL = array_photo[i];
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
        UIImage *imagerang = [UIImage imageWithData:data];
        
        NSString *path_sandox = NSHomeDirectory();
        NSString *imagePath = [path_sandox stringByAppendingString:[NSString stringWithFormat:@"/Documents/ShareWX%d.jpg",i]];
        [UIImagePNGRepresentation(imagerang) writeToFile:imagePath atomically:YES];
        
        NSURL *shareobj = [NSURL fileURLWithPath:imagePath];
        
        //imagerang : UIimage 对象
        //shareobj:NSURL 对象
        //这个方法的实际作用就是 在调起微信的分享的时候 传递给他 UIimage对象,在分享的时候 实际传递的是 NSURL对象 达到我们分享九宫格的目的
        
        SharedItem *item = [[SharedItem alloc] initWithData:imagerang andFile:shareobj];
        [activityItems addObject:item];
    }
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];*/
    
    // 实现自定义分享项
    
    // 要分享的内容，加要一个数组里边，初始化UIActivityViewController
    NSString *textToShare = @"要分享内容";
    UIImage *imageToShare = [UIImage imageNamed:@"logocc.png"];
    NSURL *urlToShare = [NSURL URLWithString:@"http://www.iashes.com/"];
    NSArray *activityItems = @[textToShare, imageToShare, urlToShare];
    
    // 创建自定义的分享项，加到一个数组里边
    MyActivity *act1 = [[MyActivity alloc]initWithImage:[UIImage imageNamed:@"logocc.png"]
                                                  atURL:@"http://iuact.cc/"
                                                atTitle:@"share Sina"
                                    atShareContentArray:activityItems];
    
    MyActivity *act2 = [[MyActivity alloc]initWithImage:[UIImage imageNamed:@"logo_64.png"]
                                                  atURL:@"http://iuact.cc"
                                                atTitle:@"share Renren"
                                    atShareContentArray:activityItems];
    
    NSArray *apps = @[act1, act2];
    
    // 创建
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:apps];
    
    //关闭系统的一些分享
    activityVC.excludedActivityTypes = @[
                                         UIActivityTypePostToFacebook,
                                         UIActivityTypePostToTwitter,
                                         UIActivityTypePostToWeibo,
                                         UIActivityTypeMessage,
                                         UIActivityTypeMail,
                                         UIActivityTypePrint,
                                         UIActivityTypeCopyToPasteboard,
                                         UIActivityTypeAssignToContact,
                                         UIActivityTypeSaveToCameraRoll,
                                         UIActivityTypeAddToReadingList,
                                         UIActivityTypePostToFlickr,
                                         UIActivityTypePostToVimeo,
                                         UIActivityTypePostToTencentWeibo,
                                         UIActivityTypeAirDrop,
                                         //UIActivityTypeOpenInIBooks
                                         ];
    //模态
    [self presentViewController:activityVC animated:YES completion:nil];
    
    // 分享完成的回调
    activityVC.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *activityError) {
        
        // 分享完成或退出分享时调用该方法 completed 是否完成,取消则是NO
        NSLog(@"分享完成");
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
