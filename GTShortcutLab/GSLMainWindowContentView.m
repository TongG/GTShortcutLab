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

NSString static* kDefaultStyleShortcutUserDefaultsKey = @"kDefaultStyleShortcutUserDefaultsKey";
NSString static* kTextureStyledShortcutUserDefaultsKey = @"kTextureStyledShortcutUserDefaultsKey";
NSString static* kRoundedStyleShortcutUserDefaultsKey = @"kRoundedStyleShortcutUserDefaultsKey";
NSString static* kRecessedStyleShortcutUserDefaultsKey = @"kRecessedStyleShortcutUserDefaultsKey";

NSString static* kDefaultStyleShortcutIdentifier = @"Default Style";
NSString static* kTexturedStyleShortcutIdentifier = @"Textured Style";
NSString static* kRoundedStyleShortcutIdentifier = @"Rounded Style";
NSString static* kRecessedStyleShortcutIdentifier = @"Recessed Style";

#pragma mark GSLMainWindowContentView class
@implementation GSLMainWindowContentView

@synthesize defaultStyleShortcutView;
@synthesize texturedStyleShortcutView;
@synthesize roundedStyleShortcutView;
@synthesize recessedStyleShortcutView;

@synthesize enableShorcutCheckBox = _enableShorcutCheckBox;

@synthesize defaultStyleMonitor;
@synthesize texturedStyleMonitor;
@synthesize roundedStyleMonitor;
@synthesize recessedStyleMonitor;

typedef void ( ^GTGlobalKeyPressedHandler )( void );
typedef void ( ^GTGlobalKeyChangedHandler )( MASShortcutView* );

- ( void ) configureTheGlobalKeyFor: ( MASShortcutView* )_ShortcutView
                     withAppearance: ( MASShortcutViewAppearance )_Appearance
                    userDefaultsKey: ( NSString* )_UserDefaultsKey
                            handler: ( GTGlobalKeyChangedHandler )_Handler
    {
    [ _ShortcutView setAppearance: _Appearance ];
    [ _ShortcutView setShortcutValueChange: _Handler ];
    [ _ShortcutView setAssociatedUserDefaultsKey: _UserDefaultsKey ];
    }

- ( MASShortcutMonitor* ) monitorForShortcutView: ( MASShortcutView* )_ShortcutView
    {
    if ( [ _ShortcutView.identifier isEqualToString: kDefaultStyleShortcutIdentifier ] )
        return self.defaultStyleMonitor;
    else if ( [ _ShortcutView.identifier isEqualToString: kTexturedStyleShortcutIdentifier ] )
        return self.texturedStyleMonitor;
    else if ( [ _ShortcutView.identifier isEqualToString: kRoundedStyleShortcutIdentifier ] )
        return self.roundedStyleMonitor;
    else if ( [ _ShortcutView.identifier isEqualToString: kRecessedStyleShortcutIdentifier ] )
        return self.recessedStyleMonitor;
    else
        return nil;
    }

- ( void ) awakeFromNib
    {
    /* When the user changed a shortcut in shortcut view
     * this block will be executed */
    GTGlobalKeyChangedHandler handlerForGlobalKeyChanged =
        ^( MASShortcutView* _Sender )
            {
            MASShortcutMonitor* monitor = [ self monitorForShortcutView: _Sender ];
            if ( monitor )
                /* Unregister the old global hotkey */
                [ MASShortcut removeGlobalHotkeyMonitor: monitor ];

            /* When the user pressed the hotkey combination
             * this block will be executed */
            GTGlobalKeyPressedHandler hanlderForGlobalKeyBePressed =
                ^( void )
                    {
                    NSLog( @"Hello, MASShortcut!" );

                    /* Anything you want to do 💥💢 */
                    };

            /* Now we should register the new global hotkey */
            MASShortcutMonitor* newMonitor = [ MASShortcut addGlobalHotkeyMonitorWithShortcut: [ _Sender shortcutValue ]
                                                                                      handler: hanlderForGlobalKeyBePressed ];
            SEL monitorSetter = nil;

            if ( [ _Sender.identifier isEqualToString: kDefaultStyleShortcutIdentifier ] )
                monitorSetter = @selector( setDefaultStyleMonitor: );
            else if ( [ _Sender.identifier isEqualToString: kTexturedStyleShortcutIdentifier ] )
                monitorSetter = @selector( setTexturedStyleMonitor: );
            else if ( [ _Sender.identifier isEqualToString: kRoundedStyleShortcutIdentifier ] )
                monitorSetter = @selector( setRoundedStyleMonitor: );
            else if ( [ _Sender.identifier isEqualToString: kRecessedStyleShortcutIdentifier ] )
                monitorSetter = @selector( setRecessedStyleMonitor: );

            [ self performSelectorOnMainThread: monitorSetter
                                    withObject: [ newMonitor copy ]
                                 waitUntilDone: YES ];
            };

    [ self configureTheGlobalKeyFor: self.defaultStyleShortcutView
                     withAppearance: MASShortcutViewAppearanceDefault
                    userDefaultsKey: kDefaultStyleShortcutUserDefaultsKey
                            handler: handlerForGlobalKeyChanged ];

    [ self configureTheGlobalKeyFor: self.texturedStyleShortcutView
                     withAppearance: MASShortcutViewAppearanceTexturedRect
                    userDefaultsKey: kTextureStyledShortcutUserDefaultsKey
                            handler: handlerForGlobalKeyChanged ];

    [ self configureTheGlobalKeyFor: self.roundedStyleShortcutView
                     withAppearance: MASShortcutViewAppearanceRounded
                    userDefaultsKey: kRoundedStyleShortcutUserDefaultsKey
                            handler: handlerForGlobalKeyChanged ];

    [ self configureTheGlobalKeyFor: self.recessedStyleShortcutView
                     withAppearance: MASShortcutViewApperanceRecessed
                    userDefaultsKey: kRecessedStyleShortcutUserDefaultsKey
                            handler: handlerForGlobalKeyChanged ];
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
    BOOL shouldBeEnabled = [ self.enableShorcutCheckBox state ] == NSOnState;

    [ self.defaultStyleShortcutView setEnabled: shouldBeEnabled ];
    [ self.texturedStyleShortcutView setEnabled: shouldBeEnabled ];
    [ self.roundedStyleShortcutView setEnabled: shouldBeEnabled ];
    [ self.recessedStyleShortcutView setEnabled: shouldBeEnabled ];
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