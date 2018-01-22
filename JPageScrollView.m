//
//  JPageScrollView.m
//
//
//  Created by Admin on 2018/1/22.
//  Copyright © 2018年 Admin. All rights reserved.
//

#import "JPageScrollView.h"

#define kDefaultTag 1000

@interface JPageScrollView ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@end

@implementation JPageScrollView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self initialization];
}
-(void)initialization
{
    self.pagingEnabled = YES;
    self.delegate = self;
    _viewType = SubViewTypeTableView;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    [self loadView];
}
-(NSInteger)page
{
    return [_jDataSource numberOfPages];
}
-(void)setViewType:(SubViewType)viewType
{
    if (_viewType != viewType) {
        _viewType = viewType;
        [self removeAllSubviews];
        [self loadView];
    }
}
-(void)loadView
{
    if (_jDelegate&&_jDataSource) {
        self.contentSize = CGSizeMake(self.bounds.size.width*self.page, self.bounds.size.height);
        switch (_viewType) {
            case SubViewTypeTableView:
            {
                for (NSInteger page = 0; page<self.page; page++) {
                    UITableView *tableView = [self.jDataSource loadTableViewAtPage:page];
                    tableView.frame = CGRectMake(self.width*page, 0, self.bounds.size.width, self.bounds.size.height);
                    tableView.tag = page+kDefaultTag;
                    tableView.delegate = self;
                    tableView.dataSource = self;
                    [self addSubview:tableView];
                }
            }
                break;
            case SubViewTypeCollectionView:
            {
                for (NSInteger page = 0; page<self.page; page++) {
                    UICollectionView *collectionView = [self.jDataSource loadCollectionViewAtPage:page];
                    collectionView.frame = CGRectMake(self.bounds.size.width*page, 0, self.bounds.size.width, self.bounds.size.height);
                    collectionView.tag = page+kDefaultTag;
                    collectionView.delegate = self;
                    collectionView.dataSource = self;
                    [self addSubview:collectionView];
                }
            }
                break;
            default:
                break;
        }
    }
}
-(void)setJDelegate:(id<JPageScrollViewDelegate>)jDelegate
{
    _jDelegate = jDelegate;
    [self loadView];
}
-(void)setJDataSource:(id<JPageScrollViewDataSource>)jDataSource
{
    _jDataSource = jDataSource;
    [self loadView];
}
-(void)scrollToPage:(NSInteger)page
{
    if (page<self.page) {
        [self setContentOffset:CGPointMake(self.bounds.size.width*page, 0) animated:YES];
    }
}
#pragma mark - UIScrollViewDelegate -
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/self.width;
    if ([_jDelegate respondsToSelector:@selector(scrollViewDidScrollAtPage:)]) {
        [_jDelegate scrollViewDidScrollAtPage:page];
    }
}
#pragma mark - TableViewDelegateAndDataSource -
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger page = tableView.tag-kDefaultTag;
    if ([_jDelegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:atPage:)]) {
        return [_jDelegate tableView:tableView heightForRowAtIndexPath:indexPath atPage:page];
    }else{
        return 44.0;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger page = tableView.tag-kDefaultTag;
    if ([_jDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:atPage:)]) {
        [_jDelegate tableView:tableView didSelectRowAtIndexPath:indexPath atPage:page];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger page = tableView.tag-kDefaultTag;
    if ([_jDataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:atPage:)]) {
        return [_jDataSource tableView:tableView numberOfRowsInSection:section atPage:page];
    }else{
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger page = tableView.tag-kDefaultTag;
    if ([_jDataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:atPage:)]) {
        return [_jDataSource tableView:tableView cellForRowAtIndexPath:indexPath atPage:page];
    }else{
        return nil;
    }
}
#pragma mark - CollectionViewDelegateAndDataSource -
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger page = collectionView.tag-kDefaultTag;
    if ([_jDelegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:atPage:)]) {
        [_jDelegate collectionView:collectionView didSelectItemAtIndexPath:indexPath atPage:page];
    }
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger page = collectionView.tag-kDefaultTag;
    if ([_jDataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:atPage:)]) {
        return [_jDataSource collectionView:collectionView numberOfItemsInSection:section atPage:page];
    }else{
        return 0;
    }
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger page = collectionView.tag-kDefaultTag;
    if ([_jDataSource respondsToSelector:@selector(collectionView:cellForItemAtIndexPath:atPage:)]) {
        return [_jDataSource collectionView:collectionView cellForItemAtIndexPath:indexPath atPage:page];
    }else{
        return nil;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger page = collectionView.tag-kDefaultTag;
    if ([_jDelegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:atPage:)]) {
        return [_jDelegate collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath atPage:page];
    }else{
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
        return flowLayout.itemSize;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    NSInteger page = collectionView.tag-kDefaultTag;
    if ([_jDelegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:atPage:)]) {
        return [_jDelegate collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section atPage:page];
    }else{
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
        return flowLayout.sectionInset;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    NSInteger page = collectionView.tag-kDefaultTag;
    if ([_jDelegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:atPage:)]) {
        return [_jDelegate collectionView:collectionView layout:collectionViewLayout minimumLineSpacingForSectionAtIndex:section atPage:page];
    }else{
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
        return flowLayout.minimumLineSpacing;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    NSInteger page = collectionView.tag-kDefaultTag;
    if ([_jDelegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:atPage:)]) {
        return [_jDelegate collectionView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section atPage:page];
    } else {
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionView.collectionViewLayout;
        return flowLayout.minimumInteritemSpacing;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
