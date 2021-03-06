//
//  CommonViews.m
//  NyimboZaKristo
//
//  Created by Nelson on 10/1/14.
//  Copyright (c) 2014 Nelson. All rights reserved.
//

#import "CommonViews.h"
#import "Constants.h"

@implementation CommonViews

// for creating imageview for logo
+ (UIImageView *)logo:(UIInterfaceOrientation)orientation{
    CGRect frame;
    UIImage *img;
    if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
        frame = CGRectMake(0, 15, 140, 55);
        img = [UIImage imageNamed:@"logoImage.png"];
    }else{
        frame = CGRectMake(0, 15, 140, 34);
        img = [UIImage imageNamed:@"logoImage.png"];
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    imageView.frame = frame;
    
    return imageView;
}

// Used for create a generic imageview
+ (UIImageView *)imageView:(NSString*)imageName frame:(CGRect)frame topInset:(CGFloat)topInset leftInset:(CGFloat)leftInset bottomInset:(CGFloat)bottomInset rightInset:(CGFloat)rightInset{
    UIImage *img = [UIImage imageNamed:imageName];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")) {
        img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(topInset, leftInset,
                                                                bottomInset,
                                                                rightInset)];
    }else{
        img = [img stretchableImageWithLeftCapWidth:(NSInteger)leftInset topCapHeight:(NSInteger)topInset];
    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    imageView.frame = frame;
    imageView.autoresizingMask = UIViewAutoresizingNone | UIViewAutoresizingFlexibleWidth;
    
    return imageView;
}

// Function used to create UILabel
+ (UILabel *)subtitleLabelView:(NSString *)title frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc]
                      initWithFrame:frame];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
    
    return label;
}

// Function to be used to creat UILabel
+ (UILabel *)labelView:(NSString *)title frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc]
                      initWithFrame:frame];
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

// Function to be used to create a switch view for yes/no
+ (UISwitch *)switchView:(NSString *)title frame:(CGRect)frame selector:(SEL)selector target:(id)target on:(BOOL)on
{
    UISwitch *uiSwitch = [[UISwitch alloc]
                          initWithFrame:frame];
    uiSwitch.onTintColor = [UIColor colorWithRed:246.0f/256.0f green:133.0f/256.0f blue:13.0f/256.0f alpha:1.0f];
    uiSwitch.on = on;
    [uiSwitch addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    return uiSwitch;
}

//Function to create UITextField
+ (CustomUITextField *)textFieldView:(NSString *)hint frame:(CGRect)frame delegate:(id)delegate viewTag: (NSInteger) viewTag nextTag: (NSInteger) nextTag previousTag: (NSInteger) previousTag
{
    CustomUITextField *textField = [[CustomUITextField alloc]
                                    initWithFrame:frame];
    
    textField.delegate = delegate;
    //changes the border style so the text field appears on screen
    textField.borderStyle = UITextBorderStyleRoundedRect;;
    textField.placeholder = hint;
    textField.tag = viewTag;
    [textField setNextTag:nextTag];
    [textField setPreviousTag:previousTag];
    
    return textField;
}

// Function to create buttons with titles
+ (UIButton *)buttonWithTitle:(NSString *)title
                       target:(id)target
                     selector:(SEL)selector
                        frame:(CGRect)frame
                        image:(UIImage *)image
                 imagePressed:(UIImage *)imagePressed
                darkTextColor:(BOOL)darkTextColor
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
    [button setBackgroundImage:newImage forState:UIControlStateNormal];

    UIImage *imageSelected = [UIImage imageNamed:@"stop"];
    
    UIImage *newImageSelected = [imageSelected stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
    
    [button setBackgroundImage:newImageSelected forState:UIControlStateSelected];
    
    
    if(imagePressed != nil){
        UIImage *newPressedImage = [imagePressed stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0];
        [button setBackgroundImage:newPressedImage forState:UIControlStateHighlighted];
    }
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // in case the parent view draws with a custom color or gradient, use a transparent color
    button.backgroundColor = [UIColor clearColor];    
    
    return button;
}
// Function to create ui title view for song details view controller
+ (UIView *)titleView:(NSString *)title
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(2.0f, 12, screenRect.size.width-4, 36.0f)];
    titleView.autoresizingMask = UIViewAutoresizingNone | UIViewAutoresizingFlexibleWidth;
    
    NSString *postFix = @".png";
    
    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@", @"title_bar_bg", postFix]];
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:img];
    bgImageView.frame = CGRectMake(0, 0, screenRect.size.width-4, 36.0f);
    bgImageView.autoresizingMask = UIViewAutoresizingNone | UIViewAutoresizingFlexibleWidth;
    
    [titleView addSubview:bgImageView];
    
    img = [UIImage imageNamed:@"title_bar_arrow.png"];
    UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:img];
    arrowImageView.frame = CGRectMake(10, 3, 20.0f, 20.0f);
    
    [titleView addSubview:arrowImageView];
    
    UILabel *label = [[UILabel alloc]
                      initWithFrame:CGRectMake(36.0f, 0.0f, screenRect.size.width-2, 22.0f)];
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
    
    [titleView addSubview:label];
    
    return titleView;
}

//Function used to create UI view action bar buttons
+ (UIBarButtonItem *)layoutActionBarButtons:(id)target
                                       home:(BOOL)home
                                   signedIn:(BOOL)signedIn orientation:(UIInterfaceOrientation)orientation {
    NSString *postFix = @".png";
    
    NSInteger buttonSize;
    if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
        buttonSize = 32;
    }else{
        buttonSize = 30;
    }
    
    UIView *rightButtonView = [[UIView alloc] init];
    rightButtonView.frame = CGRectMake(0, 0, 34, buttonSize);
    
    UIButton *homeButton = nil;
    
    if(home){
        CGRect frame = CGRectMake(0, 0, buttonSize, buttonSize);
        UIImage *homeIcon = [UIImage imageNamed:[NSString stringWithFormat:@"%@%@", @"stop", postFix]];
        homeButton = [CommonViews buttonWithTitle:@"" target:target selector:@selector(exitVideoPlayer) frame:frame image:homeIcon imagePressed:[UIImage imageNamed:@"pressed.png"] darkTextColor:NO];
        
        [rightButtonView addSubview:homeButton];
        
    }
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithCustomView:rightButtonView];
    
    return rightBarItem;
}
@end
