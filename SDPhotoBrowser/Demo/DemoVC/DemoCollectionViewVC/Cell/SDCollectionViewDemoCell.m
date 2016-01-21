//
//  SDCollectionViewDemoCell.m
//  SDPhotoBrowser
//
//  Created by gsd on 16/1/21.
//  Copyright © 2016年 GSD. All rights reserved.
//

#import "SDCollectionViewDemoCell.h"
#import "UIImageView+WebCache.h"

@implementation SDCollectionViewDemoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UIImageView *imageView = [UIImageView new];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    self.backgroundColor = [UIColor orangeColor];
}

- (void)setItem:(SDPhotoItem *)item
{
    _item = item;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnail_pic]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

@end
