//
//  JPageScrollView.h
//  HotLucky
//
//  Created by Admin on 2018/1/22.
//  Copyright © 2018年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger){
    SubViewTypeTableView,
    SubViewTypeCollectionView,
} SubViewType;

@protocol JPageScrollViewDelegate,JPageScrollViewDataSource;

@interface JPageScrollView : UIScrollView

@property (nonatomic, weak) id <JPageScrollViewDelegate> jDelegate;

@property (nonatomic, weak) id <JPageScrollViewDataSource> jDataSource;

@property (nonatomic, assign) SubViewType viewType;

@property (nonatomic, readonly) NSInteger page;

-(void)scrollToPage:(NSInteger)page;

@end

@protocol JPageScrollViewDelegate<NSObject,UIScrollViewDelegate>

@optional
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath atPage:(NSInteger)page;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath atPage:(NSInteger)page;

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath atPage:(NSInteger)page;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section atPage:(NSInteger)page;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section atPage:(NSInteger)page;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section atPage:(NSInteger)page;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath atPage:(NSInteger)page;

-(void)scrollViewDidScrollAtPage:(NSInteger)page;

@end

@protocol JPageScrollViewDataSource<NSObject,UIScrollViewDelegate>

@required
-(NSInteger)numberOfPages;

@optional
-(UITableView *)loadTableViewAtPage:(NSInteger)page;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section atPage:(NSInteger)page;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath atPage:(NSInteger)page;

-(UICollectionView *)loadCollectionViewAtPage:(NSInteger)page;
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section atPage:(NSInteger)page;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath atPage:(NSInteger)page;



@end
