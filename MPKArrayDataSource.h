//
//  MPKArrayDataSource.h
//
//  Created by Mike Rudoy on 07.08.15.
//  и в хидере тоже тру копирайты
//

#import <Foundation/Foundation.h>

@interface MPKArrayDataSource : NSObject <UITableViewDataSource>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
    emptyItemsLabel:(UILabel *)label;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
