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
@synthesize enableShorcutCheckBox = _enableShorcutCheckBox;

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

- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    NSRect oneRect = NSMakeRect( 20, 20, 50, 50 );
    NSRect offsettedRect = NSRectFromCGRect( CGRectOffset( NSRectToCGRect( oneRect ), 10, 10 ) );

    NSFrameRectWithWidth( oneRect, 3.f );
    NSFrameRectWithWidth( offsettedRect, 3.f );

    [ super drawRect: _DirtyRect ];
    }

- ( void ) keyDown: ( NSEvent* )_Event
    {
#if 0
    MASShortcut* shortcut = [ MASShortcut shortcutWithEvent: _Event ];
    NSLog( @"%@", shortcut.keyCodeString );
    NSLog( @"%@", shortcut.keyCodeStringForKeyEquivalent );
    NSLog( @"%@", shortcut.modifierFlagsString );
    NSLog( @"Complete: %@", shortcut.description );
    printf( "\n\n" );

    NSLog( @"%@", [ NSApp mainMenu ].itemArray );

    NSLog( @"%@", MASShortcutChar( 0xF710 ) );
#endif
    [ super keyDown: _Event ];
    }

#pragma mark IBActions
- ( IBAction ) enableShorcutChanged: ( id )_Sender
    {
    [ self.shortcutView setEnabled: self.enableShorcutCheckBox.state == NSOnState ];
    }

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