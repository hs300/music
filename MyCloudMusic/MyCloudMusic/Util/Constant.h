//
//  Constant.h
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#ifndef Constant_h
#define Constant_h

static NSString *const URL_VIDEO = @"v1/videos";
static NSString *const URL_AD = @"v1/ads;";
static NSString *const URL_SHEET = @"v1/sheets";

static float const TEXT_SMALL = 12;

static float const TEXT_MEDDLE = 14;
static float const TEXT_LARGE = 16;
static float const TEXT_LARGE2 = 17;
static float const TEXT_LARGE3 = 18;
static float const TEXT_LARGE4 = 22;
static float const TEXT_PEICE = 30;

static float const BUTTON_SMALL = 30;
static float const BUTTON_MEDDLE = 42;
static float const BUTTON_LARGE = 55;
static float const BUTTON_WIDTH_MEDDLE = 150;

static float const SMALL_RADIUS = 5;
static float const BUTTON_SAMLL_RADIUS = 15;
static float const BUTTON_MEDDLE_REDIUD = 21;


#pragma mark - 边距尺寸
//小小间歇
static float const PADDING_MIN = 1;

//小间歇
static float const PADDING_SMALL = 5;

//中间歇
static float const PADDING_MEDDLE = 10;

//边距间歇
static float const PADDING_OUTER = 16;

//大间歇
static float const PADDING_LARGE = 20;

//大间歇2
static float const PADDING_LARGE2 = 30;


typedef NS_ENUM(NSInteger, ListStyle){
    StyleNone,
    StyleBanner,
    StyleButton,
    StyleSheet,
    StyleSong,
    StyleFooter,
    StyleSheetMore,
    StyleSongNore,
    StyleOpen,
};

#endif /* Constant_h */
