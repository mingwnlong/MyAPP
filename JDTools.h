//
//  JDTools.h
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^cleanCacheBlock)(void);

@interface JDTools : NSObject

/**
 *  判断字符串是否为空
 *  @param string 判断的字符串
 *  @return 判断结果
 */
+ (BOOL)isEmpty:(NSString *)string;
/**
 *  判断字符串是否全是空格
 *  @param str 判断的字符串
 *  @return 判断结果
 */
+ (BOOL)isAllContainEmpty:(NSString *) str;

#pragma mark -  清理缓存
+(void)cleanCache:(cleanCacheBlock)block;

#pragma mark -整个缓存目录的大小
+(float)folderSizeAtPath;


#pragma mark - 颜色十六进制转换成UIColor
+(UIColor *) stringToColor:(NSString *)str;

#pragma mark - 把格式化的JSON格式的字符串转换成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

#pragma mark - 把字典转换成JSON格式
+ (NSString *)wlDictionaryToJson:(NSDictionary *)dic;

#pragma mark - 把数组转换成JSON格式
+ (NSString *)wlArrayToJson:(NSArray *)arr;

#pragma mark - 创建label
+ (UILabel *)allocLabel:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor frame:(CGRect)frame textAlignment:(NSTextAlignment)textAlignment;

#pragma mark - 创建button
+ (UIButton *)allocButton:(NSString *)title textColor:(UIColor *)textColor textFont:(UIFont*)textFont nom_bg:(UIImage *)nom_bg selet_bg:(UIImage *)selet_bg frame:(CGRect)frame;

#pragma mark - 创建imageView
+ (UIImageView *)allocImageView:(CGRect)frame image:(UIImage *)image;

#pragma mark - 创建textField
+ (UITextField *)allocTextFieldWithFrame:(CGRect)frame
                             placeHolder:(NSString *)string
                                delegate:(id <UITextFieldDelegate>)delegate
                           textAlignment:(NSTextAlignment)textAlignment
                                    font:(UIFont *)font
                               textColor:(UIColor *)textColor;
#pragma mark - 获取当前时间 字符串 
+(NSString *)getNowTimeTimestamp;

#pragma mark - 获取当前时间
+(NSInteger)getNowTimestamp;

#pragma mark - 将后台返回的时间 转化为 时间戳
+(NSDate *)getServertime:(NSString *)dateStr;

#pragma mark - 将某个时间转化成 时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

#pragma mark - 将某个时间戳转化成 时间
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;

#pragma mark - 计算两个日期之间的天数
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate;

#pragma mark -根据图片url获取图片尺寸
+(CGSize)getImageSizeWithURL:(id)imageURL;

#pragma mark - 获取PNG图片的大小 获取PNG图片的大小
+(CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request;

#pragma mark -  获取gif图片的大小
+(CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request;

#pragma mark -  获取jpg图片的大小
+(CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request;


#pragma mark - 获取动态文本宽高
+(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;

+(CGRect)getboundSizeWith:(NSString *)string andSiez:(CGSize)size font:(UIFont *)font;
#pragma mark - 从URL加载图片
+ (UIImage *) imageFromURLString: (NSString *) urlstring ;

#pragma mark - 拍照后 对图片旋转位置处理
+ (UIImage *)fixOrientation:(UIImage *)aImage;

/*! 永久闪烁动画 */
+(CABasicAnimation *)opacityForever_Animation:(CGFloat)time;

/**
 @param price 输入小数
 @param position 小数点后的位数
 @return 返回 限定后的字符串
 */
+(NSString *)notRounding:(float)price afterPoint:(int)position;


@end
