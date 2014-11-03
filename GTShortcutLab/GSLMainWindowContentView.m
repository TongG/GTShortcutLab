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
#import "MASShortcutView.h"

#pragma mark GSLMainWindowContentView class
@implementation GSLMainWindowContentView

@synthesize shortcutView = _shortcutView;

- ( void ) awakeFromNib
    {
    self.shortcutView.appearance = MASShortcutViewAppearanceTexturedRect;
    }

- ( BOOL ) canBecomeKeyView
    {
    return YES;
    }

- ( BOOL ) acceptsFirstResponder
    {
    return YES;
    }

typedef void ( ^GSLPrintBlock )( void );
- ( void ) handleBlocks: ( GSLPrintBlock )_Block
    {
    GSLPrintBlock anotherPrintFuckBlock = [ _Block copy ];
    GSLPrintBlock fuckingBlock = [ anotherPrintFuckBlock copy ];

    NSLog( @"%@", anotherPrintFuckBlock );
    NSLog( @"%@", fuckingBlock );
    }

- ( void ) keyDown: ( NSEvent* )_Event
    {
    NSString* TongGuo = @"Long live TongGuo!";
    NSUInteger count = 20;

    GSLPrintBlock printFuck =
        ^void ( void )
            {
            for ( int index = 0; index < count; index++ )
                NSLog( @"%@", TongGuo );
            };

    [ self handleBlocks: printFuck ];

//    dispatch_once_t static sOnceToken;
//    dispatch_once( &sOnceToken, printFuck );

//    unsigned long stdFlags = ( NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask | NSNumericPadKeyMask );
//    NSLog( @"Standard Flags: %lu", stdFlags );
//
//    MASShortcut* shortcut = [ MASShortcut shortcutWithKeyCode: kVK_ANSI_O
//                                                modifierFlags: stdFlags ];
//    NSLog( @"Key code after filtering: %lu", [ shortcut keyCode ] );
//    NSLog( @"Carbon key code: %u", [ shortcut carbonKeyCode ] );
//    NSLog( @"Flags after filtering: %lu", [ shortcut modifierFlags ] );
//    printf( "\n\n" );

//    MASShortcut* shortcut = [ MASShortcut shortcutWithEvent: _Event ];
//    shortcut
//    NSLog( @"%@", shortcut.keyCodeString );
//    NSLog( @"%@", shortcut.keyCodeStringForKeyEquivalent );
//    NSLog( @"%@", shortcut.modifierFlagsString );
//    NSLog( @"Complete: %@", shortcut.description );
//    printf( "\n\n" );
//
//    NSLog( @"%@", [ NSApp mainMenu ].itemArray );
//
//    NSLog( @"%@", MASShortcutChar( 0xF710 ) );

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