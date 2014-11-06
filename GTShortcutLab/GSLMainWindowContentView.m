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

@synthesize monitor = _monitor;

- ( void ) awakeFromNib
    {
    self.shortcutView.appearance = MASShortcutViewAppearanceTexturedRect;

    [ self.shortcutView setShortcutValueChange:
        ^( MASShortcutView* _Sender )
            {
            if ( self.monitor )
                [ MASShortcut removeGlobalHotkeyMonitor: self.monitor ];

            MASShortcutMonitor* monitor = [ MASShortcut addGlobalHotkeyMonitorWithShortcut: [ _Sender shortcutValue ]
                                                                                   handler: ^{ NSLog( @"Fuck!" ); } ];
            if ( monitor )
                self.monitor = [ monitor copy ];
            } ];

    [ self.shortcutView setAssociatedUserDefaultsKey: @"MASShortcutViewUserDefautKey" ];
    }

- ( BOOL ) canBecomeKeyView
    {
    return YES;
    }

- ( BOOL ) acceptsFirstResponder
    {
    return YES;
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