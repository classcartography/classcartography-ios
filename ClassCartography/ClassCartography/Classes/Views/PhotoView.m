//
//  PhotoView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "PhotoView.h"


@implementation PhotoView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-bg"]];
        [self addSubview:bgView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 254, 254)];
        imageView.image = [UIImage imageNamed:@"stock-img.jpg"];
        imageView.backgroundColor = [UIColor blackColor];
        [self addSubview:imageView];
    }
    
    return self;
}


@end
