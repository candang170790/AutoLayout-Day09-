//
//  ViewController.m
//  Autolayout(day09)
//
//  Created by iOS17 on 10/28/13.
//  Copyright (c) 2013 iOS17. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UIImageView *image1;
@property(nonatomic,strong) UIImageView *image2;
@property(nonatomic,strong) UIImageView *image3;
@property (nonatomic,strong) NSArray *array1;
@property (nonatomic,strong) NSArray *array2;
@end
static int dem;
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dem = 0;
    _image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face1"]];
    
    [self.view addSubview:_image1];
    _image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face2"]];
    [self.view addSubview:_image2];
    _image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"face3"]];
    [self.view addSubview:_image3];
    [_image1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_image2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_image3 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
   
}
-(void)orientationChanged:(NSNotification *)notifi{
    UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)[UIDevice currentDevice].orientation;
    NSDictionary *viewDictionary = NSDictionaryOfVariableBindings(_image1,_image2,_image3);
    
    if (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        [self.view removeConstraints:_array1];
        [self.view removeConstraints:_array2];
       
       _array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(90)-[_image2]-(90)-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
        [self.view addConstraints:_array1];
        
        _array2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_image1(_image2)]-20-[_image2(_image3)]-20-[_image3]-10-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDictionary];
        [self.view addConstraints:_array2];

        dem++;
    }
    else
    {
        
        if (dem) {
            [self.view removeConstraints:_array1];
            [self.view removeConstraints:_array2];
        }
        _array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[_image1]-80-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDictionary];
        [self.view addConstraints:_array1];
        
        _array2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_image1(_image2)]-20-[_image2(_image3)]-20-[_image3]-30-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
        [self.view addConstraints:_array2];
        dem++;
    }

/*
    switch (interfaceOrientation) {
        case UIInterfaceOrientationLandscapeRight & UIInterfaceOrientationLandscapeLeft{
            NSArray *array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[_image1]-80-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
            [self.view addConstraints:array1];
            
            NSArray *array = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_image1(_image2)]-20-[_image2(_image3)]-20-[_image3]-30-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
            [self.view addConstraints:array];
            break;
        }
        case UIInterfaceOrientationPortraitUpsideDown:{
            NSArray *array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[_image2]-80-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
            [self.view addConstraints:array1];
            
            NSArray *array = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[_image1(_image2)]-20-[_image2(_image3)]-20-[_image3]-30-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
            [self.view addConstraints:array];
            break;
        }
        case UIInterfaceOrientationLandscapeRight:{
            NSArray *array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[_image2]-80-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
            [self.view addConstraints:array1];
            
            NSArray *array = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_image1(_image2)]-20-[_image2(_image3)]-20-[_image3]-10-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDictionary];
            [self.view addConstraints:array];
            break;
            //nameOrientation = @"Ngang 1";
            break;
        }
        case UIInterfaceOrientationLandscapeLeft:{
            NSArray *array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[_image2]-80-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewDictionary];
            [self.view addConstraints:array1];
            
            NSArray *array = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_image1(_image2)]-20-[_image2(_image3)]-20-[_image3]-10-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewDictionary];
            [self.view addConstraints:array];
            break;
            //nameOrientation = @"Ngang 1";
            break;

        }
        default:
            break;
    }
 */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
