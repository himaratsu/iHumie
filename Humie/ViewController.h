//
//  ViewController.h
//  Humie
//
//  Created by rhiramat on 2013/03/23.
//  Copyright (c) 2013年 rhiramat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFOpenFlowView.h"

@interface ViewController : UIViewController <AFOpenFlowViewDelegate, AFOpenFlowViewDataSource>

@property (nonatomic, strong) AFOpenFlowView    *flowView;
@property (nonatomic, assign) NSInteger         selectionIndex;

@end
