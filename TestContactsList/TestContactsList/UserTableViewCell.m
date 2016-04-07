//
//  UserTableViewCell.m
//  TestContactsList
//
//  Created by ZhangBob on 4/2/16.
//  Copyright © 2016 JixinZhang. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headerphoto = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
        [self.contentView addSubview:self.headerphoto];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 200,25)];
        [self.contentView addSubview:self.nameLabel];
        
        self.isOnLine = [[UILabel alloc] initWithFrame:CGRectMake(60, 40, 50, 5)];
        self.isOnLine.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.isOnLine];
        
        self.introductionLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 180, 5)];
        self.introductionLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.introductionLabel];
        
        self.networkLabel = [[UILabel alloc] initWithFrame:CGRectMake(320 - 50, 5, 50, 25)];
        self.networkLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.networkLabel];
    }
    
    return self;
}

@end
