//
//  SDDemoCell.m
//  SDPhotoBrowser
//
//  Created by gsd on 16/1/21.
//  Copyright © 2016年 GSD. All rights reserved.
//

#import "SDDemoCell.h"



@implementation SDDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setuoView];
    }
    return self;
}

- (void)setuoView
{
    SDPhotoGroup *photosGroup = [SDPhotoGroup new];
    [self.contentView addSubview:photosGroup];
    self.photosGroup = photosGroup;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.photosGroup.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}

@end
