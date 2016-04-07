//
//  UserTableViewCell.h
//  TestContactsList
//
//  Created by ZhangBob on 4/2/16.
//  Copyright © 2016 JixinZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headerphoto;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *isOnLine;
@property (nonatomic, strong) UILabel *introductionLabel;
@property (nonatomic, strong) UILabel *networkLabel;


@end
