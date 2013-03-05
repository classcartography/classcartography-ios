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
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 255, 255)];
        imageView.backgroundColor = [UIColor blackColor];
        [self addSubview:imageView];
    }
    
    return self;
}


@end
