//
//  AppDelegate.swift
//  BLKRoutineHelper
//
//  Created by black9 on 24/07/15.
//  Copyright © 2015 black9. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)
    let popover = NSPopover()

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        setupStatusItem()
    }
    func setupStatusItem()
    {
        if let button = statusItem.button {
            button.image = NSImage(named: "statusBarButtonImage")
            button.action = Selector("togglePopover:")
        }
        popover.contentViewController = QuoteViewController(nibName:"QuoteViewController",bundle:nil)
    }


    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}
//MARK - popover toggling
extension AppDelegate
{
    func togglePopover(sender:AnyObject)
    {
        if popover.shown {
            closePopover(sender)
        }
        else {
            openPopover(sender)
        }
    }
    func closePopover(sender:AnyObject)
    {
        popover.performClose(sender)
    }
    func openPopover(sender:AnyObject)
    {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: .MinY)
        }
    }
}

extension AppDelegate
{
    func createMenu()
    {
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Print quote", action: Selector("printQuote:"), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Exit", action: Selector("terminate:"), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    func printQuote(sender:AnyObject)
    {
        let quote = "quote"
        let author = "author"
        
        print("\(quote) - \(author)")
    }
}
