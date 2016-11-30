//
//  SharedItem.h
//  UIActivityDemo

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//自定义了一个实现UIActivityItemSource协议的类 ShareItem

@interface SharedItem : NSObject<UIActivityItemSource>

-(instancetype)initWithData:(UIImage*)img andFile:(NSURL*)file;

@property (nonatomic, strong) UIImage *img;
@property (nonatomic, strong) NSURL *path;

@end
