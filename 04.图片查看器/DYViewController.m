//
//  DYViewController.m
//  04.图片查看器
//
//  Created by YOU on 15/3/28.
//  Copyright (c) 2015年 YOU. All rights reserved.
//

#import "DYViewController.h"

@interface DYViewController ()
@property(nonatomic,strong) UILabel *nolable;
@property(nonatomic,strong) UIImageView *iconview;
@property(nonatomic,strong) UIButton *leftButton;
@property(nonatomic,strong) UIButton *rightButton;
@property(nonatomic,strong) UILabel *desclable;

@property(nonatomic,assign)int index;

@property(nonatomic,copy)NSArray *imgList;


@end

@implementation DYViewController
-(UILabel *)nolable{
    if (_nolable==nil) {
        UILabel *lable  =[[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 40)];
        _nolable=lable;
        _nolable.textAlignment=NSTextAlignmentCenter;
        [self.view addSubview:_nolable];
    }
    return _nolable;
}

-(UIImageView *)iconview{
    CGFloat imageWidth=200;
    CGFloat imageHeight=200;
    CGFloat imageX=(self.view.bounds.size.width-imageWidth)*0.5;
    CGFloat imageY=CGRectGetMaxY(self.nolable.frame)+20;
    if (_iconview==nil) {
        _iconview=[[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageWidth, imageHeight)];
        [self.view addSubview:_iconview];
    }
    return _iconview;
}


-(UIButton *)leftButton{
    if (_leftButton==nil) {
        _leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        CGFloat centerX=self.iconview.frame.origin.x*0.5;
        CGFloat centerY=self.iconview.center.y;
        _leftButton.center=CGPointMake(centerX, centerY);
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
          [_leftButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
        _leftButton.tag=-1;
        [_leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftButton];
    }
    return  _leftButton;
}

-(UIButton *)rightButton{
    if (_rightButton==nil) {
        _rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        CGFloat centerX=self.view.frame.size.width-self.iconview.frame.origin.x*0.5;
        CGFloat centerY=self.iconview.center   .y;
        _rightButton.center=CGPointMake(centerX, centerY);
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
        _rightButton.tag=1;
        [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_rightButton];
    }
    return  _rightButton;
}

-(UILabel *)desclable{
    if(_desclable==nil  ){
        CGFloat descY=CGRectGetMaxY(self.iconview.frame);
        _desclable=[[UILabel alloc]initWithFrame:CGRectMake(0, descY, self.view.bounds.size.width, 100)];
        _desclable.textAlignment=NSTextAlignmentCenter;
        _desclable.numberOfLines=0;
        [self.view addSubview:_desclable];
        
    }
    return _desclable;
}

-(void)showPhotoInfo{
    self.nolable.text=[NSString stringWithFormat:@"%d/%d",self.index+1,5];
    self.iconview.image=[UIImage imageNamed:self.imgList[self.index][@"name"]];
    self.desclable.text=[NSString stringWithFormat:@"%@",self.imgList[self.index][@"desc"]];
    self.rightButton.enabled=(self.index!=4);
    self.leftButton.enabled=(self.index!=0);
}

-(void)clickButton:(UIButton *)button{
    self.index+=button.tag;
    [self showPhotoInfo];
}

-(NSArray *)imgList{
    if (_imgList==nil) {
        
        NSString *path=[[NSBundle mainBundle]pathForResource:@"ImageList" ofType:@"plist"];
        _imgList=    [NSArray arrayWithContentsOfFile:path];
    }
    return _imgList;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self showPhotoInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
