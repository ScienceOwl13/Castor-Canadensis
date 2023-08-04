//
//  ApplicationMenu.swift
//  Castor Canadensis
//
//  Created by Connor Groen on 2023-08-03.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
         
        let jokeView = JokeView()
        let topView = NSHostingController(rootView: jokeView)
        topView.view.frame.size = CGSize(width: 225, height: 225)

        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        
        // About
        let aboutMenuItem = NSMenuItem(title: "About",
                                       action: #selector(about),
                                    keyEquivalent: "")
        aboutMenuItem.target = self
        
        // Quit
        let quitMenuItem = NSMenuItem(title: "Quit",
                                      action: #selector(quit),
                                      keyEquivalent: "q")
        quitMenuItem.target = self
        
        // Seperator
        
        // Desk Lamp On
        let deskLampOnMenuItem = NSMenuItem(title: "Desk Lamp On",
                                       action: #selector(deskLampOn),
                                       keyEquivalent: "1")
        deskLampOnMenuItem.target = self
        deskLampOnMenuItem.representedObject = "shortcuts://run-shortcut?name=DL%20on&input="
        
        // Desk Lamp off
        let deskLampOffMenuItem = NSMenuItem(title: "Desk Lamp Off",
                                       action: #selector(deskLampOn),
                                       keyEquivalent: "2")
        deskLampOffMenuItem.target = self
        deskLampOffMenuItem.representedObject = "shortcuts://run-shortcut?name=Sort%20Lines&input=clipboard"
        
        
        
        /* CREATE THE VIEW */
        
        menu.addItem(deskLampOnMenuItem)
        menu.addItem(deskLampOffMenuItem)
        
        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(aboutMenuItem)
        menu.addItem(quitMenuItem)


        
        
        return menu
    }
    
    //About Menu
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    // Desk Lamp Control
        // On
        @objc func deskLampOn(sender: NSMenuItem) {
            let link = sender.representedObject as! String
            guard let url = URL(string: link) else { return }
            NSWorkspace.shared.open(url)
        }
        
        // Off
        @objc func deskLampOff(sender: NSMenuItem) {
            let link = sender.representedObject as! String
            guard let url = URL(string: link) else { return }
            NSWorkspace.shared.open(url)
        }
    // Quit Menu
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
