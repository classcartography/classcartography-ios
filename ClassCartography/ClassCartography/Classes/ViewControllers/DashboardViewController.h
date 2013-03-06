//
//  DashboardViewController.h
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import <UIKit/UIKit.h>
#import "InBloomAPIHandler.h"
#import "PhotoView.h"
#import "GraphView.h"
#import "CommentView.h"
#import "NotificationView.h"


@interface DashboardViewController : UIViewController <InBloomAPIHandlerDelegate> {
    
    UILabel *helloLabel;
    PhotoView *photoView;
    GraphView *graphView;
    CommentView *commentView;
    NotificationView *notificationView;
}

@end
