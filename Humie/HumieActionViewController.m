//
//  HumieActionViewController.m
//  Humie
//
//  Created by rhiramat on 2013/03/23.
//  Copyright (c) 2013年 rhiramat. All rights reserved.
//

#import "HumieActionViewController.h"

@interface HumieActionViewController ()

@end

@implementation HumieActionViewController

- (id)initWithImage:(UIImage *)image {
    self = [self init];
    if (self) {
        self.image = image;
    }
    return self;
}

- (void)dealloc {
    // 近接センサをOFF
    [self stopSensor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // サウンドの準備
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSURL *url = [NSURL fileURLWithPath:[mainBundle pathForResource:@"yooo" ofType:@"wav"]];
    sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [sound prepareToPlay];
    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    
    // 注意ラベル
    UILabel *noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 20)];
    noticeLabel.text = @"画面を踏んで下さい";
    noticeLabel.backgroundColor = [UIColor clearColor];
    noticeLabel.textColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    noticeLabel.textAlignment = NSTextAlignmentCenter;
    noticeLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    [self.view addSubview:noticeLabel];
    
    // 踏み絵画像
    UIImageView *humieImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                           10+noticeLabel.frame.size.height,
                                                                           frame.size.width,
                                                                            frame.size.height-40-44)];
    humieImage.image = _image;
    humieImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:humieImage];
    
    // 近接センサSTART
    [self startSensor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 近接センサをONに
- (void)startSensor {
    // 近接センサオン
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    // 近接センサ監視
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(proximitySensorStateDidchange:)
                                                 name:UIDeviceProximityStateDidChangeNotification
                                               object:nil];
}

- (void)stopSensor {
    // 近接センサオフ
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
    
    // 近接センサ監視解除
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceProximityStateDidChangeNotification
                                                  object:nil];
}

// 近接センサの値が変更
- (void)proximitySensorStateDidchange:(NSNotification *)notification {
    // センサに近づいたら踏み絵成功
    if ([UIDevice currentDevice].proximityState == YES) {
        // 1.アラート出す
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"よろしい"
                                                        message:@"踏み絵に成功しました"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        
        // 2.サウンドを鳴らす
        [self playSound];
    }
}

// サウンドをバックグラウンドで再生
- (void)playSound {
    [self performSelectorInBackground:@selector(playSoundInBackGround)
                           withObject:nil];
}

// サウンド再生
-(void)playSoundInBackGround {
    [sound play];
}


@end
