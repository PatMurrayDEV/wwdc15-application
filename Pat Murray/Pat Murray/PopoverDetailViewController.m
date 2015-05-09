//
//  PopoverDetailViewController.m
//
//  Created by Shuichi Tsutsumi on 2014/09/14.
//  Modified by Patrick Murray on 20/4/15.
//  Copyright (c) 2014 Shuichi Tsutsumi. All rights reserved.
//

#import "PopoverDetailViewController.h"

@interface PopoverDetailViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIImageView *bgImageView;
@end


@implementation PopoverDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.imageView.image = self.image;
    self.bgImageView.image = self.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

// =============================================================================
#pragma mark - IBAction

- (IBAction)closeBtnTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
