// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import CoreGraphics;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSCoder;

SWIFT_CLASS("_TtC22IQKeyboardManagerSwift15IQBarButtonItem")
@interface IQBarButtonItem : UIBarButtonItem
+ (void)initialize;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIColor;
@class UIImage;
@class UIFont;
@class UIGestureRecognizer;
@class UITouch;
@class UIViewController;
@class UIView;


/// <hr/>
/// <h2>MARK: IQToolbar tags</h2>
/// Codeless drop-in universal library allows to prevent issues of keyboard sliding up and cover UITextField/UITextView. Neither need to write any code nor any setup required and much more. A generic version of KeyboardManagement. https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html
SWIFT_CLASS("_TtC22IQKeyboardManagerSwift17IQKeyboardManager")
@interface IQKeyboardManager : NSObject <UIGestureRecognizerDelegate>

/// Enable/disable managing distance between keyboard and textField. Default is YES(Enabled when class loads in +(void)load method).
@property (nonatomic) BOOL enable;

/// To set keyboard distance from textField. can't be less than zero. Default is 10.0.
@property (nonatomic) CGFloat keyboardDistanceFromTextField;

/// Prevent keyboard manager to slide up the rootView to more than keyboard height. Default is YES.
@property (nonatomic) BOOL preventShowingBottomBlankSpace;

/// Returns the default singleton instance.
+ (IQKeyboardManager * _Nonnull)sharedManager;

/// <hr/>
/// <h2>MARK: IQToolbar handling</h2>
/// <code>Automatic add the IQToolbar functionality. Default is YES.
/// 
/// </code>
@property (nonatomic) BOOL enableAutoToolbar;

/// If YES, then uses textField's tintColor property for IQToolbar, otherwise tint color is black. Default is NO.
@property (nonatomic) BOOL shouldToolbarUsesTextFieldTintColor;

/// This is used for toolbar.tintColor when textfield.keyboardAppearance is UIKeyboardAppearanceDefault. If shouldToolbarUsesTextFieldTintColor is YES then this property is ignored. Default is nil and uses black color.
@property (nonatomic, strong) UIColor * _Nullable toolbarTintColor;

/// If YES, then hide previous/next button. Default is NO.
@property (nonatomic) BOOL shouldHidePreviousNext;

/// Toolbar done button icon, If nothing is provided then check toolbarDoneBarButtonItemText to draw done button.
@property (nonatomic, strong) UIImage * _Nullable toolbarDoneBarButtonItemImage;

/// Toolbar done button text, If nothing is provided then system default 'UIBarButtonSystemItemDone' will be used.
@property (nonatomic, copy) NSString * _Nullable toolbarDoneBarButtonItemText;

/// If YES, then it add the textField's placeholder text on IQToolbar. Default is YES.
@property (nonatomic) BOOL shouldShowTextFieldPlaceholder;

/// Placeholder Font. Default is nil.
@property (nonatomic, strong) UIFont * _Nullable placeholderFont;

/// <h2>MARK: UIKeyboard appearance overriding</h2>
/// Override the keyboardAppearance for all textField/textView. Default is NO.
@property (nonatomic) BOOL overrideKeyboardAppearance;

/// If overrideKeyboardAppearance is YES, then all the textField keyboardAppearance is set using this property.
@property (nonatomic) UIKeyboardAppearance keyboardAppearance;
@property (nonatomic) BOOL shouldResignOnTouchOutside;

/// Resigns currently first responder field.
- (BOOL)resignFirstResponder;

/// Returns YES if can navigate to previous responder textField/textView, otherwise NO.
@property (nonatomic, readonly) BOOL canGoPrevious;

/// Returns YES if can navigate to next responder textField/textView, otherwise NO.
@property (nonatomic, readonly) BOOL canGoNext;

/// Navigate to previous responder textField/textView.
- (BOOL)goPrevious;

/// Navigate to next responder textField/textView.
- (BOOL)goNext;

/// Note: returning YES is guaranteed to allow simultaneous recognition. returning NO is not guaranteed to prevent simultaneous recognition, as the other gesture's delegate may return YES.
- (BOOL)gestureRecognizer:(UIGestureRecognizer * _Nonnull)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer * _Nonnull)otherGestureRecognizer;

/// To not detect touch events in a subclass of UIControl, these may have added their own selector for specific work
- (BOOL)gestureRecognizer:(UIGestureRecognizer * _Nonnull)gestureRecognizer shouldReceiveTouch:(UITouch * _Nonnull)touch;

/// <hr/>
/// <h2>MARK: UISound handling</h2>
/// <code>If YES, then it plays inputClick sound on next/previous/done click.
/// 
/// </code>
@property (nonatomic) BOOL shouldPlayInputClicks;

/// <hr/>
/// <h2>MARK: UIAnimation handling</h2>
/// <code>If YES, then calls 'setNeedsLayout' and 'layoutIfNeeded' on any frame update of to viewController's view.
/// 
/// </code>
@property (nonatomic) BOOL layoutIfNeededOnUpdate;

/// <hr/>
/// <h2>@name InteractivePopGestureRecognizer handling</h2>
/// <code> If YES, then always consider UINavigationController.view begin point as {0,0}, this is a workaround to fix a bug #464 because there are no notification mechanism exist when UINavigationController.view.frame gets changed internally.
/// 
/// </code>
@property (nonatomic) BOOL shouldFixInteractivePopGestureRecognizer;

/// <hr/>
/// <h2>MARK: Class Level disabling methods</h2>
/// <code> Disable distance handling within the scope of disabled distance handling viewControllers classes. Within this scope, 'enabled' property is ignored. Class should be kind of UIViewController.
/// 
/// </code>
@property (nonatomic, copy) NSArray<SWIFT_METATYPE(UIViewController)> * _Nonnull disabledDistanceHandlingClasses;

/// Enable distance handling within the scope of enabled distance handling viewControllers classes. Within this scope, 'enabled' property is ignored. Class should be kind of UIViewController. If same Class is added in disabledDistanceHandlingClasses list, then enabledDistanceHandlingClasses will be ignored.
@property (nonatomic, copy) NSArray<SWIFT_METATYPE(UIViewController)> * _Nonnull enabledDistanceHandlingClasses;

/// Disable automatic toolbar creation within the scope of disabled toolbar viewControllers classes. Within this scope, 'enableAutoToolbar' property is ignored. Class should be kind of UIViewController.
@property (nonatomic, copy) NSArray<SWIFT_METATYPE(UIViewController)> * _Nonnull disabledToolbarClasses;

/// Enable automatic toolbar creation within the scope of enabled toolbar viewControllers classes. Within this scope, 'enableAutoToolbar' property is ignored. Class should be kind of UIViewController. If same Class is added in disabledToolbarClasses list, then enabledToolbarClasses will be ignore.
@property (nonatomic, copy) NSArray<SWIFT_METATYPE(UIViewController)> * _Nonnull enabledToolbarClasses;

/// Allowed subclasses of UIView to add all inner textField, this will allow to navigate between textField contains in different superview. Class should be kind of UIView.
@property (nonatomic, copy) NSArray<SWIFT_METATYPE(UIView)> * _Nonnull toolbarPreviousNextAllowedClasses;

/// Disabled classes to ignore 'shouldResignOnTouchOutside' property, Class should be kind of UIViewController.
@property (nonatomic, copy) NSArray<SWIFT_METATYPE(UIViewController)> * _Nonnull disabledTouchResignedClasses;

/// Enabled classes to forcefully enable 'shouldResignOnTouchOutsite' property. Class should be kind of UIViewController. If same Class is added in disabledTouchResignedClasses list, then enabledTouchResignedClasses will be ignored.
@property (nonatomic, copy) NSArray<SWIFT_METATYPE(UIViewController)> * _Nonnull enabledTouchResignedClasses;

/// <hr/>
/// MARK: Third Party Library support
/// Add TextField/TextView Notifications customised NSNotifications. For example while using YYTextView https://github.com/ibireme/YYText
///
/// <hr/>
/// <code>Add customised Notification for third party customised TextField/TextView. Please be aware that the NSNotification object must be idential to UITextField/UITextView NSNotification objects and customised TextField/TextView support must be idential to UITextField/UITextView.
/// @param didBeginEditingNotificationName This should be identical to UITextViewTextDidBeginEditingNotification
/// @param didEndEditingNotificationName This should be identical to UITextViewTextDidEndEditingNotification
/// 
/// </code>
- (void)registerTextFieldViewClass:(SWIFT_METATYPE(UIView) _Nonnull)aClass didBeginEditingNotificationName:(NSString * _Nonnull)didBeginEditingNotificationName didEndEditingNotificationName:(NSString * _Nonnull)didEndEditingNotificationName;
- (void)reloadLayoutIfNeeded;
@property (nonatomic) BOOL enableDebugging;
@end

@class UITextField;
@class UITextView;
@class NSURL;
@class NSTextAttachment;


/// Manages the return key to work like next/done in a view hierarchy.
SWIFT_CLASS("_TtC22IQKeyboardManagerSwift26IQKeyboardReturnKeyHandler")
@interface IQKeyboardReturnKeyHandler : NSObject <UIScrollViewDelegate, UITextViewDelegate, UITextFieldDelegate>

/// <hr/>
/// <h2>MARK: Settings</h2>
/// <code>Delegate of textField/textView.
/// 
/// </code>
@property (nonatomic, strong) id <UITextFieldDelegate, UITextViewDelegate> _Nullable delegate;

/// Set the last textfield return key type. Default is UIReturnKeyDefault.
@property (nonatomic) UIReturnKeyType lastTextFieldReturnKeyType;

/// <hr/>
/// <h2>MARK: Initialization/Deinitialization</h2>
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;

/// Add all the textFields available in UIViewController's view.
- (nonnull instancetype)initWithController:(UIViewController * _Nonnull)controller OBJC_DESIGNATED_INITIALIZER;

/// <hr/>
/// <h2>MARK: Registering/Unregistering textFieldView</h2>
/// <code>Should pass UITextField/UITextView intance. Assign textFieldView delegate to self, change it's returnKeyType.
/// 
/// @param textFieldView UITextField/UITextView object to register.
/// 
/// </code>
- (void)addTextFieldView:(UIView * _Nonnull)view;

/// Should pass UITextField/UITextView intance. Restore it's textFieldView delegate and it's returnKeyType.
///
/// @param textFieldView UITextField/UITextView object to unregister.
- (void)removeTextFieldView:(UIView * _Nonnull)view;

/// Add all the UITextField/UITextView responderView's.
///
/// @param UIView object to register all it's responder subviews.
- (void)addResponderFromView:(UIView * _Nonnull)view;

/// Remove all the UITextField/UITextView responderView's.
///
/// @param UIView object to unregister all it's responder subviews.
- (void)removeResponderFromView:(UIView * _Nonnull)view;

/// <hr/>
/// <h2>MARK: UITextField/UITextView delegates</h2>
- (BOOL)textFieldShouldBeginEditing:(UITextField * _Nonnull)textField;
- (BOOL)textFieldShouldEndEditing:(UITextField * _Nonnull)textField;
- (void)textFieldDidBeginEditing:(UITextField * _Nonnull)textField;
- (void)textFieldDidEndEditing:(UITextField * _Nonnull)textField;
- (BOOL)textField:(UITextField * _Nonnull)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString * _Nonnull)string;
- (BOOL)textFieldShouldClear:(UITextField * _Nonnull)textField;
- (BOOL)textFieldShouldReturn:(UITextField * _Nonnull)textField;
- (BOOL)textViewShouldBeginEditing:(UITextView * _Nonnull)textView;
- (BOOL)textViewShouldEndEditing:(UITextView * _Nonnull)textView;
- (void)textViewDidBeginEditing:(UITextView * _Nonnull)textView;
- (void)textViewDidEndEditing:(UITextView * _Nonnull)textView;
- (BOOL)textView:(UITextView * _Nonnull)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString * _Nonnull)text;
- (void)textViewDidChange:(UITextView * _Nonnull)textView;
- (void)textViewDidChangeSelection:(UITextView * _Nonnull)textView;
- (BOOL)textView:(UITextView * _Nonnull)textView shouldInteractWithURL:(NSURL * _Nonnull)URL inRange:(NSRange)characterRange;
- (BOOL)textView:(UITextView * _Nonnull)textView shouldInteractWithTextAttachment:(NSTextAttachment * _Nonnull)textAttachment inRange:(NSRange)characterRange;
@end



/// @abstract UITextView with placeholder support
SWIFT_CLASS("_TtC22IQKeyboardManagerSwift10IQTextView")
@interface IQTextView : UITextView
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)awakeFromNib;

/// @abstract To set textView's placeholder text. Default is ni.
@property (nonatomic, copy) NSString * _Nullable placeholder;
- (void)layoutSubviews;
- (void)refreshPlaceholder;
@property (nonatomic, copy) NSString * _Null_unspecified text;
@property (nonatomic, strong) UIFont * _Nullable font;
@property (nonatomic, strong) id <UITextViewDelegate> _Nullable delegate;
@end


SWIFT_CLASS("_TtC22IQKeyboardManagerSwift20IQTitleBarButtonItem")
@interface IQTitleBarButtonItem : IQBarButtonItem
@property (nonatomic, strong) UIFont * _Nullable font;
@property (nonatomic, copy) NSString * _Nullable title;

/// selectableTextColor to be used for displaying button text when button is enabled.
@property (nonatomic, strong) UIColor * _Nullable selectableTextColor;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end



/// @abstract   IQToolbar for IQKeyboardManager.
SWIFT_CLASS("_TtC22IQKeyboardManagerSwift9IQToolbar")
@interface IQToolbar : UIToolbar <UIInputViewAudioFeedback>
+ (void)initialize;
@property (nonatomic, strong) UIFont * _Nullable titleFont;
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic, copy) NSString * _Nullable doneTitle;
@property (nonatomic, strong) UIImage * _Nullable doneImage;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (CGSize)sizeThatFits:(CGSize)size;
@property (nonatomic, strong) UIColor * _Null_unspecified tintColor;
@property (nonatomic) UIBarStyle barStyle;
- (void)layoutSubviews;
@property (nonatomic, readonly) BOOL enableInputClicksWhenVisible;
@end


@interface NSObject (SWIFT_EXTENSION(IQKeyboardManagerSwift))
- (NSString * _Nonnull)_IQDescription;
@end


@interface UIScrollView (SWIFT_EXTENSION(IQKeyboardManagerSwift))

/// To set customized distance from keyboard for textField/textView. Can't be less than zero
@property (nonatomic) BOOL shouldRestoreScrollViewContentOffset;
@end


@interface UIView (SWIFT_EXTENSION(IQKeyboardManagerSwift))

/// To set customized distance from keyboard for textField/textView. Can't be less than zero
@property (nonatomic) CGFloat keyboardDistanceFromTextField;
@end


@interface UIView (SWIFT_EXTENSION(IQKeyboardManagerSwift))

/// <hr/>
/// <h2>MARK: canBecomeFirstResponder</h2>
/// <code>Returns YES if IQKeyboardManager asking for `canBecomeFirstResponder. Useful when doing custom work in `textFieldShouldBeginEditing:` delegate.
/// 
/// </code>
@property (nonatomic) BOOL isAskingCanBecomeFirstResponder;

/// <hr/>
/// <h2>MARK: viewControllers</h2>
/// <code>Returns the UIViewController object that manages the receiver.
/// 
/// </code>
- (UIViewController * _Nullable)viewController;

/// Returns the topMost UIViewController object in hierarchy.
- (UIViewController * _Nullable)topMostController;

/// <hr/>
/// <h2>MARK: Superviews/Subviews/Siglings</h2>
/// <code>Returns the superView of provided class type.
/// 
/// </code>
- (UIView * _Nullable)superviewOfClassType:(Class _Nonnull)classType;

/// Returns all siblings of the receiver which canBecomeFirstResponder.
- (NSArray<UIView *> * _Nonnull)responderSiblings;

/// Returns all deep subViews of the receiver which canBecomeFirstResponder.
- (NSArray<UIView *> * _Nonnull)deepResponderViews;

/// <hr/>
/// <h2>MARK: Special TextFields</h2>
/// <code>Returns YES if the receiver object is UISearchBarTextField, otherwise return NO.
/// 
/// </code>
- (BOOL)isSearchBarTextField;

/// Returns YES if the receiver object is UIAlertSheetTextField, otherwise return NO.
- (BOOL)isAlertViewTextField;

/// <hr/>
/// <h2>MARK: Transform</h2>
/// <code>Returns current view transform with respect to the 'toView'.
/// 
/// </code>
- (CGAffineTransform)convertTransformToView:(UIView * _Nullable)toView;
@end


@interface UIView (SWIFT_EXTENSION(IQKeyboardManagerSwift))

/// <hr/>
/// <h2>MARK: Title and Distance</h2>
/// <code>If `shouldHidePlaceholderText` is YES, then title will not be added to the toolbar. Default to NO.
/// 
/// </code>
@property (nonatomic) BOOL shouldHidePlaceholderText;

/// placeholderText to override default placeholder text when drawing text on toolbar.
@property (nonatomic, copy) NSString * _Nullable placeholderText;

/// drawingPlaceholderText will be actual text used to draw on toolbar. This would either placeholder or placeholderText.
@property (nonatomic, readonly, copy) NSString * _Nullable drawingPlaceholderText;

/// <hr/>
/// <h2>MARK: Done</h2>
/// <code>Helper function to add Done button on keyboard.
/// 
/// @param target Target object for selector.
/// @param action Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// 
/// </code>
- (void)addDoneOnKeyboardWithTarget:(id _Nullable)target action:(SEL _Null_unspecified)action;

/// Helper function to add Done button on keyboard.
///
/// @param target Target object for selector.
/// @param action Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param titleText text to show as title in IQToolbar'.
- (void)addDoneOnKeyboardWithTarget:(id _Nullable)target action:(SEL _Null_unspecified)action titleText:(NSString * _Nullable)titleText;

/// Helper function to add Done button on keyboard.
///
/// @param target Target object for selector.
/// @param action Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param shouldShowPlaceholder A boolean to indicate whether to show textField placeholder on IQToolbar'.
- (void)addDoneOnKeyboardWithTarget:(id _Nullable)target action:(SEL _Null_unspecified)action shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// <hr/>
/// <h2>MARK: Right</h2>
/// <code> Helper function to add Right button on keyboard.
///  
///  @param image Image icon to use as right button.
///  @param target Target object for selector.
///  @param action Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
///  @param titleText text to show as title in IQToolbar'.
/// 
/// </code>
- (void)addRightButtonOnKeyboardWithImage:(UIImage * _Nonnull)image target:(id _Nullable)target action:(SEL _Null_unspecified)action titleText:(NSString * _Nullable)titleText;

/// Helper function to add Right button on keyboard.
///
/// @param image Image icon to use as right button.
/// @param target Target object for selector.
/// @param action Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param shouldShowPlaceholder A boolean to indicate whether to show textField placeholder on IQToolbar'.
- (void)addRightButtonOnKeyboardWithImage:(UIImage * _Nonnull)image target:(id _Nullable)target action:(SEL _Null_unspecified)action shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// Helper function to add Right button on keyboard.
///
/// @param text Title for rightBarButtonItem, usually 'Done'.
/// @param target Target object for selector.
/// @param action Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
- (void)addRightButtonOnKeyboardWithText:(NSString * _Nonnull)text target:(id _Nullable)target action:(SEL _Null_unspecified)action;

/// Helper function to add Right button on keyboard.
///
/// @param text Title for rightBarButtonItem, usually 'Done'.
/// @param target Target object for selector.
/// @param action Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param titleText text to show as title in IQToolbar'.
- (void)addRightButtonOnKeyboardWithText:(NSString * _Nonnull)text target:(id _Nullable)target action:(SEL _Null_unspecified)action titleText:(NSString * _Nullable)titleText;

/// Helper function to add Right button on keyboard.
///
/// @param text Title for rightBarButtonItem, usually 'Done'.
/// @param target Target object for selector.
/// @param action Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param shouldShowPlaceholder A boolean to indicate whether to show textField placeholder on IQToolbar'.
- (void)addRightButtonOnKeyboardWithText:(NSString * _Nonnull)text target:(id _Nullable)target action:(SEL _Null_unspecified)action shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// <hr/>
/// <h2>MARK: Cancel/Done</h2>
/// <code>Helper function to add Cancel and Done button on keyboard.
/// 
/// @param target Target object for selector.
/// @param cancelAction Cancel button action name. Usually 'cancelAction:(IQBarButtonItem*)item'.
/// @param doneAction Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// 
/// </code>
- (void)addCancelDoneOnKeyboardWithTarget:(id _Nullable)target cancelAction:(SEL _Null_unspecified)cancelAction doneAction:(SEL _Null_unspecified)doneAction;

/// Helper function to add Cancel and Done button on keyboard.
///
/// @param target Target object for selector.
/// @param cancelAction Cancel button action name. Usually 'cancelAction:(IQBarButtonItem*)item'.
/// @param doneAction Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param titleText text to show as title in IQToolbar'.
- (void)addCancelDoneOnKeyboardWithTarget:(id _Nullable)target cancelAction:(SEL _Null_unspecified)cancelAction doneAction:(SEL _Null_unspecified)doneAction titleText:(NSString * _Nullable)titleText;

/// Helper function to add Cancel and Done button on keyboard.
///
/// @param target Target object for selector.
/// @param cancelAction Cancel button action name. Usually 'cancelAction:(IQBarButtonItem*)item'.
/// @param doneAction Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param shouldShowPlaceholder A boolean to indicate whether to show textField placeholder on IQToolbar'.
- (void)addCancelDoneOnKeyboardWithTarget:(id _Nullable)target cancelAction:(SEL _Null_unspecified)cancelAction doneAction:(SEL _Null_unspecified)doneAction shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// <hr/>
/// <h2>MARK: Right/Left</h2>
/// <code>Helper function to add Left and Right button on keyboard.
/// 
/// @param target Target object for selector.
/// @param leftButtonTitle Title for leftBarButtonItem, usually 'Cancel'.
/// @param rightButtonTitle Title for rightBarButtonItem, usually 'Done'.
/// @param leftButtonAction Left button action name. Usually 'cancelAction:(IQBarButtonItem*)item'.
/// @param rightButtonAction Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// 
/// </code>
- (void)addRightLeftOnKeyboardWithTarget:(id _Nullable)target leftButtonTitle:(NSString * _Nonnull)leftButtonTitle rightButtonTitle:(NSString * _Nonnull)rightButtonTitle rightButtonAction:(SEL _Null_unspecified)rightButtonAction leftButtonAction:(SEL _Null_unspecified)leftButtonAction;

/// Helper function to add Left and Right button on keyboard.
///
/// @param target Target object for selector.
/// @param leftButtonTitle Title for leftBarButtonItem, usually 'Cancel'.
/// @param rightButtonTitle Title for rightBarButtonItem, usually 'Done'.
/// @param leftButtonAction Left button action name. Usually 'cancelAction:(IQBarButtonItem*)item'.
/// @param rightButtonAction Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param titleText text to show as title in IQToolbar'.
- (void)addRightLeftOnKeyboardWithTarget:(id _Nullable)target leftButtonTitle:(NSString * _Nonnull)leftButtonTitle rightButtonTitle:(NSString * _Nonnull)rightButtonTitle rightButtonAction:(SEL _Null_unspecified)rightButtonAction leftButtonAction:(SEL _Null_unspecified)leftButtonAction titleText:(NSString * _Nullable)titleText;

/// Helper function to add Left and Right button on keyboard.
///
/// @param target Target object for selector.
/// @param leftButtonTitle Title for leftBarButtonItem, usually 'Cancel'.
/// @param rightButtonTitle Title for rightBarButtonItem, usually 'Done'.
/// @param leftButtonAction Left button action name. Usually 'cancelAction:(IQBarButtonItem*)item'.
/// @param rightButtonAction Right button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param shouldShowPlaceholder A boolean to indicate whether to show textField placeholder on IQToolbar'.
- (void)addRightLeftOnKeyboardWithTarget:(id _Nullable)target leftButtonTitle:(NSString * _Nonnull)leftButtonTitle rightButtonTitle:(NSString * _Nonnull)rightButtonTitle rightButtonAction:(SEL _Null_unspecified)rightButtonAction leftButtonAction:(SEL _Null_unspecified)leftButtonAction shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// <hr/>
/// <h2>MARK: Previous/Next/Done</h2>
/// <code>Helper function to add ArrowNextPrevious and Done button on keyboard.
/// 
/// @param target Target object for selector.
/// @param previousAction Previous button action name. Usually 'previousAction:(id)item'.
/// @param nextAction Next button action name. Usually 'nextAction:(id)item'.
/// @param doneAction Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// 
/// </code>
- (void)addPreviousNextDoneOnKeyboardWithTarget:(id _Nullable)target previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction doneAction:(SEL _Null_unspecified)doneAction;

/// Helper function to add ArrowNextPrevious and Done button on keyboard.
///
/// @param target Target object for selector.
/// @param previousAction Previous button action name. Usually 'previousAction:(id)item'.
/// @param nextAction Next button action name. Usually 'nextAction:(id)item'.
/// @param doneAction Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param titleText text to show as title in IQToolbar'.
- (void)addPreviousNextDoneOnKeyboardWithTarget:(id _Nullable)target previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction doneAction:(SEL _Null_unspecified)doneAction titleText:(NSString * _Nullable)titleText;

/// Helper function to add ArrowNextPrevious and Done button on keyboard.
///
/// @param target Target object for selector.
/// @param previousAction Previous button action name. Usually 'previousAction:(id)item'.
/// @param nextAction Next button action name. Usually 'nextAction:(id)item'.
/// @param doneAction Done button action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param shouldShowPlaceholder A boolean to indicate whether to show textField placeholder on IQToolbar'.
- (void)addPreviousNextDoneOnKeyboardWithTarget:(id _Nullable)target previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction doneAction:(SEL _Null_unspecified)doneAction shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// <hr/>
/// <h2>MARK: Previous/Next/Right</h2>
/// <code>Helper function to add ArrowNextPrevious and Right button on keyboard.
/// 
/// @param target Target object for selector.
/// @param rightButtonTitle Title for rightBarButtonItem, usually 'Done'.
/// @param previousAction Previous button action name. Usually 'previousAction:(id)item'.
/// @param nextAction Next button action name. Usually 'nextAction:(id)item'.
/// @param rightButtonAction RightBarButton action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param titleText text to show as title in IQToolbar'.
/// 
/// </code>
- (void)addPreviousNextRightOnKeyboardWithTarget:(id _Nullable)target rightButtonImage:(UIImage * _Nonnull)rightButtonImage previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction rightButtonAction:(SEL _Null_unspecified)rightButtonAction titleText:(NSString * _Nullable)titleText;
- (void)addPreviousNextRightOnKeyboardWithTarget:(id _Nullable)target rightButtonImage:(UIImage * _Nonnull)rightButtonImage previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction rightButtonAction:(SEL _Null_unspecified)rightButtonAction shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// Helper function to add ArrowNextPrevious and Right button on keyboard.
///
/// @param target Target object for selector.
/// @param rightButtonTitle Title for rightBarButtonItem, usually 'Done'.
/// @param previousAction Previous button action name. Usually 'previousAction:(id)item'.
/// @param nextAction Next button action name. Usually 'nextAction:(id)item'.
/// @param rightButtonAction RightBarButton action name. Usually 'doneAction:(IQBarButtonItem*)item'.
- (void)addPreviousNextRightOnKeyboardWithTarget:(id _Nullable)target rightButtonTitle:(NSString * _Nonnull)rightButtonTitle previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction rightButtonAction:(SEL _Null_unspecified)rightButtonAction;

/// Helper function to add ArrowNextPrevious and Right button on keyboard.
///
/// @param target Target object for selector.
/// @param rightButtonTitle Title for rightBarButtonItem, usually 'Done'.
/// @param previousAction Previous button action name. Usually 'previousAction:(id)item'.
/// @param nextAction Next button action name. Usually 'nextAction:(id)item'.
/// @param rightButtonAction RightBarButton action name. Usually 'doneAction:(IQBarButtonItem*)item'.
/// @param titleText text to show as title in IQToolbar'.
- (void)addPreviousNextRightOnKeyboardWithTarget:(id _Nullable)target rightButtonTitle:(NSString * _Nonnull)rightButtonTitle previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction rightButtonAction:(SEL _Null_unspecified)rightButtonAction titleText:(NSString * _Nullable)titleText;
- (void)addPreviousNextRightOnKeyboardWithTarget:(id _Nullable)target rightButtonTitle:(NSString * _Nonnull)rightButtonTitle previousAction:(SEL _Null_unspecified)previousAction nextAction:(SEL _Null_unspecified)nextAction rightButtonAction:(SEL _Null_unspecified)rightButtonAction shouldShowPlaceholder:(BOOL)shouldShowPlaceholder;

/// <hr/>
/// <h2>MARK: Enable/Disable Previous/Next</h2>
/// <code>Helper function to enable and disable previous next buttons.
/// 
/// @param isPreviousEnabled BOOL to enable/disable previous button on keyboard.
/// @param isNextEnabled  BOOL to enable/disable next button on keyboard..
/// 
/// </code>
- (void)setEnablePrevious:(BOOL)isPreviousEnabled isNextEnabled:(BOOL)isNextEnabled;
@end

@class NSLayoutConstraint;

@interface UIViewController (SWIFT_EXTENSION(IQKeyboardManagerSwift))

/// To set customized distance from keyboard for textField/textView. Can't be less than zero
@property (nonatomic, strong) IBOutlet NSLayoutConstraint * _Nullable IQLayoutGuideConstraint;
@end


@interface UIWindow (SWIFT_EXTENSION(IQKeyboardManagerSwift))

/// @return Returns the current Top Most ViewController in hierarchy.
- (UIViewController * _Nullable)topMostController;

/// @return Returns the topViewController in stack of topMostController.
- (UIViewController * _Nullable)currentViewController;
@end

#pragma clang diagnostic pop