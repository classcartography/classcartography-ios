//
//  GraphView.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "GraphView.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        _chart = [ShinobiChart lineChartForBrowserUsageWithFrame:self.bounds];
        _chart.title = @"Overall Class Performance";
        _chart.licenseKey = @"SaT4LeSLC2D5uL9MjAxMzA0MDNpbmZvQHNoaW5vYmljb250cm9scy5jb20=3lo58geh0gQoogPZ8PIH+Oqks9gBfDeXIeNwe3jFuNeXC4JMzuKGVs+oMGqQTg4DrY/+LYTAxnm4mdjgkh6WUyrePEWgVNXcL10hKIN/i/q3X2kiuapu7QDG1KXwgxPik7ZiVRZubSub3X47pomXyj5Qr7O0=BQxSUisl3BaWf/7myRmmlIjRnMU2cA7q+/03ZX9wdj30RzapYANf51ee3Pi8m2rVW6aD7t6Hi4Qy5vv9xpaQYXF5T7XzsafhzS3hbBokp36BoJZg8IrceBj742nQajYyV7trx5GIw9jy/V6r0bvctKYwTim7Kzq+YPWGMtqtQoU=PFJTQUtleVZhbHVlPjxNb2R1bHVzPnh6YlRrc2dYWWJvQUh5VGR6dkNzQXUrUVAxQnM5b2VrZUxxZVdacnRFbUx3OHZlWStBK3pteXg4NGpJbFkzT2hGdlNYbHZDSjlKVGZQTTF4S2ZweWZBVXBGeXgxRnVBMThOcDNETUxXR1JJbTJ6WXA3a1YyMEdYZGU3RnJyTHZjdGhIbW1BZ21PTTdwMFBsNWlSKzNVMDg5M1N4b2hCZlJ5RHdEeE9vdDNlMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjwvUlNBS2V5VmFsdWU+";

        studentData = [StudentData new];
        datasource = [Datasource new];
        datasource.graphData = studentData;
        _chart.datasource = datasource;
        _chart.delegate = self;
        [self addSubview:_chart];
    }
    
    return self;
}

#pragma mark - ShinobiChart Delegate
- (void)sChart:(ShinobiChart *)chart alterTickMark:(SChartTickMark *)tickMark beforeAddingToAxis:(SChartAxis *)axis {
    //remove some of the tickmarks in portrait
    if ([axis isXAxis]) {
        
        BOOL iPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
        if (!iPad || UIInterfaceOrientationIsPortrait([[UIDevice currentDevice] orientation])) {
            
            //xAxis is a category, each tick value is 1,2,3,4,.. etc
            //a mod 2 operation will give us every other xValue
            if ((int)tickMark.value%2) {
                tickMark.tickLabel.text = @"";
            }
        }
    }
}

@end
