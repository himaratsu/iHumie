//
//  HumieActionViewController.h
//  Humie
//
//  Created by rhiramat on 2013/03/23.
//  Copyright (c) 2013年 rhiramat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HumieActionViewController : UIViewController {
    AVAudioPlayer *sound;
}

@property (nonatomic, strong) UIImage *image;

- (id)initWithImage:(UIImage*)image;

@end
