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

#import "GSLMainWindowContentView.h"

#pragma mark GSLMainWindowContentView class
@implementation GSLMainWindowContentView

- ( BOOL ) canBecomeKeyView
    {
    return YES;
    }

- ( BOOL ) acceptsFirstResponder
    {
    return YES;
    }

- ( void ) keyDown: ( NSEvent* )_Event
    {
//    unsigned long stdFlags = ( NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask | NSNumericPadKeyMask );
//    NSLog( @"Standard Flags: %lu", stdFlags );
//
//    MASShortcut* shortcut = [ MASShortcut shortcutWithKeyCode: kVK_ANSI_O
//                                                modifierFlags: stdFlags ];
//    NSLog( @"Key code after filtering: %lu", [ shortcut keyCode ] );
//    NSLog( @"Carbon key code: %u", [ shortcut carbonKeyCode ] );
//    NSLog( @"Flags after filtering: %lu", [ shortcut modifierFlags ] );
//    printf( "\n\n" );

    MASShortcut* shortcut = [ MASShortcut shortcutWithEvent: _Event ];
    NSLog( @"Key code: %lu", [ shortcut keyCode ] );
    NSLog( @"Carbon key code: %u", [ shortcut carbonKeyCode ] );
    NSLog( @"Modifier Flags: %lu", [ shortcut modifierFlags ] );
    NSLog( @"Carbon Flags: %u", [ shortcut carbonFlags ] );
    NSLog( @"%@", shortcut );
    printf( "\n\n" );

    [ super keyDown: _Event ];
    }

#if 0
- ( void ) mouseDown: ( NSEvent* )_Event
    {
    MASShortcut* shortcut = [ MASShortcut shortcutWithEvent: _Event ];

    [ super mouseDown: _Event ];
    }
#endif
@end // GSLMainWindowContentView class

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