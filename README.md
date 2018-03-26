# SDPhotoBrowser
A image browser which is easy for using.
非常简单易用的图片浏览器，模仿微博图片浏览器动感效果，综合了图片展示和存储等多项功能。

1. 创建SDPhotoBrowser实例

  SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];

  browser.sourceImagesContainerView = 原图的父控件;

  browser.imageCount = 原图的数量;

  browser.currentImageIndex = 当前需要展示图片的index;

  browser.delegate = 代理;

  [browser show];  // 展示图片浏览器


2.实现代理方法

// 返回临时占位图片（即原来的小图）

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    ；
}

// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    ；
}

![](http://cdn.cocimg.com/bbs/attachment/Fid_19/19_441660_6319c50c34ed63c.gif) 
