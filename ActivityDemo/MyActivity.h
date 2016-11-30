//
//  MyActivity.h
//  ActivityDemo

#import <UIKit/UIKit.h>

typedef void (^ActivityShareBlock)(NSString *theErrorMessage);

// 自定义UIActivity
@interface MyActivity : UIActivity

@property (nonatomic,strong) UIImage *shareImage;
@property (nonatomic,copy)NSString *URL;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)ActivityShareBlock shareBlock;
@property (nonatomic,strong)NSArray *getShareArray;

-(instancetype)initWithImage:(UIImage *)shareImage atURL:(NSString *)URL atTitle:(NSString *)title atShareContentArray:(NSArray *)shareContentArray;

@end
