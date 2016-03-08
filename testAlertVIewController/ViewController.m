//
//  ViewController.m
//  testAlertVIewController
//
//  Created by 尹春风 on 16/3/8.
//  Copyright © 2016年 尹春风. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *butt2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *butt = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 80, 40)];
    [butt addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [butt setTitle:@"model1" forState:UIControlStateNormal];
    [butt setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:butt];
    
    
    UIButton *butt2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 80, 40)];
    [butt2 addTarget:self action:@selector(buttonClickModel2) forControlEvents:UIControlEventTouchUpInside];
    [butt2 setTitle:@"model2" forState:UIControlStateNormal];
    [butt2 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:butt2];
    _butt2 = butt2;
    
    UIButton *butt3 = [[UIButton alloc] initWithFrame:CGRectMake(250, 100, 80, 40)];
    [butt3 addTarget:self action:@selector(buttonClickModel3) forControlEvents:UIControlEventTouchUpInside];
    [butt3 setTitle:@"model3" forState:UIControlStateNormal];
    [butt3 setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:butt3];


}
-(void)buttonClick{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"这个是UIAlertController的默认样式"preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"登录";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
        NSLog(@"cancel button clicked");
    
    }];
    

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UITextField *login = alertController.textFields.firstObject;
        UITextField *password = alertController.textFields.lastObject;
        NSString *loginer =login.text ;
        NSString *pwd =password.text ;
        NSLog(@"%@-is login with actionViewController-%@",loginer,pwd);
    }];

    [alertController addAction:cancelAction];
    [alertController addAction:okAction];

//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:cancelAction];
//    [alertController addAction:deleteAction];
    [alertController addAction:archiveAction];
    
    
    [self presentViewController:alertController animated:YES completion:^{
    
    }];

}

- (void)buttonClickModel2
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel button clicked");

    }];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"delete button clicked");

    }];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"save button clicked");

    }];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:archiveAction];
    
    [self presentViewController:alertController animated:YES completion:^{
      
        NSLog(@"alertController did appear !");

        
    }];
    
    
}

- (void)buttonClickModel3
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存或删除数据" message:@"删除数据将不可恢复" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel button clicked");
        
    }];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"delete button clicked");
        
    }];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"save button clicked");
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:archiveAction];
    
    [self presentViewController:alertController animated:YES completion:^{
        
        NSLog(@"alertController did appear !");
        
        
    }];

    
    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    if (popover){
        popover.sourceView = _butt2;
        popover.sourceRect = _butt2.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
