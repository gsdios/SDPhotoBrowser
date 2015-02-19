//
//  SDTableViewController.m
//  SDPhotoBrowser
//
//  Created by aier on 15-2-4.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "SDTableViewController.h"
#import "SDPhotoGroup.h"
#import "SDPhotoItem.h"

@interface SDTableViewController ()

@property (nonatomic, strong) NSArray *srcStringArray;

@end

@implementation SDTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 170;
    
    self.title = @"图片浏览(GSD)";
    
    _srcStringArray = @[@"http://ww1.sinaimg.cn/thumbnail/67307b53jw1eoxmhonbmrg208c05thdv.gif",
                        @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                        @"http://ww4.sinaimg.cn/thumbnail/996e0d92jw1eoxm33bf5hj20br0bqjso.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/9b8146edjw1ep36zlbxphg205k07nnpg.gif",
                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                        @"http://ww4.sinaimg.cn/thumbnail/67307b53jw1ep3583mtd9j20p03hvkjl.jpg"];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"photo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    SDPhotoGroup *photoGroup = [[SDPhotoGroup alloc] init];
    
    NSMutableArray *temp = [NSMutableArray array];
    [_srcStringArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
        SDPhotoItem *item = [[SDPhotoItem alloc] init];
        item.thumbnail_pic = src;
        [temp addObject:item];
    }];
    
    photoGroup.photoItemArray = [temp copy];
    [cell.contentView addSubview:photoGroup];
    
    return cell;
}


@end
