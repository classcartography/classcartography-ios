//
//  DashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import "PhotoView.h"
#import "GraphView.h"
#import "CommentView.h"
#import "NotificationView.h"


@interface DashboardViewController : UIViewController {
    PhotoView *photoView;
    GraphView *graphView;
    CommentView *commentView;
    NotificationView *notificationView;
}

@end
