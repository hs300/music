//
//  TermServiceDailogController.m
//  MyCloudMusic
//
//  Created by xiaolong on 2023/12/10.
//

#import "TermServiceDailogController.h"
#import "ViewFactoryUtil.h"
#import "R.h"
#import "Constant.h"
@interface TermServiceDailogController ()<QMUIModalPresentationContentViewControllerProtocol>

@end

@implementation TermServiceDailogController

- (void)initViews{
    [super initViews];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.myWidth = MyLayoutSize.fill;
    self.view.myHeight = MyLayoutSize.wrap;
    self.view.layer.cornerRadius = 3;
    _viewLayout = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    _viewLayout.subviewSpace = 0.5f;
    _viewLayout.myWidth = MyLayoutSize.fill;
    _viewLayout.myHeight = MyLayoutSize.wrap;
    
    [self.view addSubview:_viewLayout];
    
    _contentContainer = [[MyLinearLayout alloc] initWithOrientation:MyOrientation_Vert];
    _contentContainer.subviewSpace = 25;
    _contentContainer.myWidth = MyLayoutSize.fill;
    _contentContainer.myHeight = MyLayoutSize.wrap;
    _contentContainer.padding = UIEdgeInsetsMake(30, 16, 30, 16);
    _contentContainer.gravity = MyGravity_Horz_Center;
    
    [_viewLayout addSubview:_contentContainer];
    [_contentContainer addSubview:self.textView];
    _content = [[UITextView alloc] init];
    _content.myHeight = 230;
    _content.myWidth = MyLayoutSize.fill;
    _content.text = @"由于在开发Oak语言时，尚且不存在运行字节码的硬件平台，所以为了在开发时可以对这种语言进行实验研究，他们就在已有的硬件和软件平台基础上，按照自己所指定的规范，用软件建设了一个运行平台，整个系统除了比C++更加简单之外，没有什么大的区别。1992年的夏天，当Oak语言开发成功后，研究者们向硬件生产商进行演示了Green操作系统、Oak的程序设计语言、类库和其硬件，以说服他们使用Oak语言生产硬件芯片，但是，硬件生产商并未对此产生极大的热情。因为他们认为，在所有人对Oak语言还一无所知的情况下，就生产硬件产品的风险实在太大了，所以Oak语言也就因为缺乏硬件的支持而无法进入市场，从而被搁置了下来。";
    _content.font = [UIFont systemFontOfSize:14];
    [_content setEditable:NO];
    _content.textColor = [UIColor redColor];
    self.textView.backgroundColor = [UIColor clearColor];
    [_contentContainer addSubview:_content];

    [_contentContainer addSubview:self.yesBtn];
    [_contentContainer addSubview:self.noBtn];
}

- (void)show{
    self.modalController = [[QMUIModalPresentationViewController alloc] init];
    self.modalController.animationStyle = QMUIModalPresentationAnimationStyleFade;
    [self.modalController setModal:YES];
    
    self.modalController.contentViewMargins = UIEdgeInsetsMake(PADDING_LARGE2, PADDING_LARGE2, PADDING_LARGE2, PADDING_LARGE2);
    
    self.modalController.contentViewController = self;
    
    [self.modalController showWithAnimated:YES completion:nil];
}


- (void)hide{
    [self.modalController hideWithAnimated:YES completion:nil];
}

-(UILabel *)textView{
    if (!_textView) {
        _textView = [[UILabel alloc] init];
        _textView.myHeight = MyLayoutSize.wrap;
        _textView.myWidth = MyLayoutSize.fill;
        _textView.text = @"服务条款和隐私协议提示";
        _textView.textAlignment = NSTextAlignmentCenter;
        _textView.font = [UIFont boldSystemFontOfSize:20];
        _textView.textColor = [UIColor blackColor];
    }
    return _textView;
}

- (QMUIButton *)yesBtn{
    if (!_yesBtn) {
        _yesBtn = [ViewFactoryUtil primaryHalfFillBtn];
        [_yesBtn setTitle:R.string.localizable.agree forState:UIControlStateNormal];
    }
    return _yesBtn;
}

-(QMUIButton *)noBtn{
    if (!_noBtn) {
        _noBtn = [ViewFactoryUtil linkButton];
        [_noBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_noBtn setTitle:R.string.localizable.disagree forState:UIControlStateNormal];
        [_noBtn sizeToFit];
        [_noBtn addTarget:self action:@selector(disagree) forControlEvents:UIControlEventTouchUpInside];
    }
    return _noBtn;
}


- (void)disagreeClick:(UIButton *)sender{
    [self hide];
    exit(0);
}
@end
