///:
/*****************************************************************************
 **                                                                         **
 **                               .======.                                  **
 **                               | INRI |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                      .========'      '========.                         **
 **                      |   _      xxxx      _   |                         **
 **                      |  /_;-.__ / _\  _.-;_\  |                         **
 **                      |     `-._`'`_/'`.-'     |                         **
 **                      '========.`\   /`========'                         **
 **                               | |  / |                                  **
 **                               |/-.(  |                                  **
 **                               |\_._\ |                                  **
 **                               | \ \`;|                                  **
 **                               |  > |/|                                  **
 **                               | / // |                                  **
 **                               | |//  |                                  **
 **                               | \(\  |                                  **
 **                               |  ``  |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                   \\    _  _\\| \//  |//_   _ \// _                     **
 **                  ^ `^`^ ^`` `^ ^` ``^^`  `^^` `^ `^                     **
 **                                                                         **
 **                       Copyright (c) 2014 Tong G.                        **
 **                          ALL RIGHTS RESERVED.                           **
 **                                                                         **
 ****************************************************************************/

#import <Cocoa/Cocoa.h>

@class MASShortcutView;

#pragma mark GSLMainWindowContentView class
@interface GSLMainWindowContentView : NSView

@property ( nonatomic, unsafe_unretained ) IBOutlet MASShortcutView* defaultStyleShortcutView;
@property ( nonatomic, unsafe_unretained ) IBOutlet MASShortcutView* texturedStyleShortcutView;
@property ( nonatomic, unsafe_unretained ) IBOutlet MASShortcutView* roundedStyleShortcutView;
@property ( nonatomic, unsafe_unretained ) IBOutlet MASShortcutView* recessedStyleShortcutView;

@property ( nonatomic, unsafe_unretained ) IBOutlet NSButton* enableShorcutCheckBox;

@property ( nonatomic, copy ) MASShortcutMonitor* defaultStyleMonitor;
@property ( nonatomic, copy ) MASShortcutMonitor* texturedStyleMonitor;
@property ( nonatomic, copy ) MASShortcutMonitor* roundedStyleMonitor;
@property ( nonatomic, copy ) MASShortcutMonitor* recessedStyleMonitor;

@end // GLSMainWindowContentView class

//////////////////////////////////////////////////////////////////////////////

/*****************************************************************************
 **                                                                         **
 **      _________                                      _______             **
 **     |___   ___|                                   / ______ \            **
 **         | |     _______   _______   _______      | /      |_|           **
 **         | |    ||     || ||     || ||     ||     | |    _ __            **
 **         | |    ||     || ||     || ||     ||     | |   |__  \           **
 **         | |    ||     || ||     || ||     ||     | \_ _ __| |  _        **
 **         |_|    ||_____|| ||     || ||_____||      \________/  |_|       **
 **                                           ||                            **
 **                                    ||_____||                            **
 **                                                                         **
 ****************************************************************************/
///:~