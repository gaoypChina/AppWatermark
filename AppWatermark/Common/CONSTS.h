
#pragma mark -- tools

//取图的简写方式
#define IMG(imageName) [UIImage imageNamed:imageName]

#pragma mark - 颜色相关 -

#define COLOR(rgbValue) COLORA(rgbValue,1.0)
//有alpha值
#define COLORA(rgbValue,alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:alphaValue]



