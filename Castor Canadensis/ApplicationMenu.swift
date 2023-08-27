//
//  ApplicationMenu.swift
//  Castor Canadensis
//
//  Created by Connor Groen on 2023-08-03.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    
	@AppStorage("defaultBrowser") var defaultBrowser: String = "Safari"

    lazy var showDefaultBrowser : NSMenuItem = {
        return NSMenuItem(title: "Default Browser: \(defaultBrowser)", action: nil, keyEquivalent: "")
    }()


    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
                
		// ContentView() in the menu bar
		/*
        let topView = NSHostingController(rootView: ContentView())
        topView.view.frame.size = CGSize(width: 225, height: 225)

        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
		 */
        
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
        
        
        // Desk Lamp On
        let deskLampOnMenuItem = NSMenuItem(title: "Desk Lamp On",
                                            action: #selector(deskLampOn),
                                            keyEquivalent: "i")
        deskLampOnMenuItem.target = self
        deskLampOnMenuItem.representedObject = "shortcuts://run-shortcut?name=DL%20on&input="
        
        // Desk Lamp off
        let deskLampOffMenuItem = NSMenuItem(title: "Desk Lamp Off",
                                             action: #selector(deskLampOn),
                                             keyEquivalent: "o")
        deskLampOffMenuItem.target = self
        deskLampOffMenuItem.representedObject = "shortcuts://run-shortcut?name=DL%20Off&input="
        
        // Toggle default browser
        let toggleDefaultBrowserItem = NSMenuItem(title: "Toggle Default Browser",
                                              action: #selector(runPythonScript),
                                              keyEquivalent: "")
        toggleDefaultBrowserItem.target = self
		
		// Clear Downloads
		
		let clearDownloadsItem = NSMenuItem(title: "Clear Downloads",
											action: #selector(clearDownloads),
											keyEquivalent: "c")
		clearDownloadsItem.target = self
		clearDownloadsItem.representedObject = "shortcuts://run-shortcut?name=Clear%20Downloads%1C&input="
        
        
        
        /* CREATE THE VIEW */
        
        menu.addItem(toggleDefaultBrowserItem)
        menu.addItem(showDefaultBrowser)
        
        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(deskLampOnMenuItem)
        menu.addItem(deskLampOffMenuItem)
		menu.addItem(clearDownloadsItem)
        
        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(aboutMenuItem)
        menu.addItem(quitMenuItem)
        
        
        return menu
    }
    
    //About Menu
    @objc func about(sender: NSMenuItem) {
		NSApp.orderFrontStandardAboutPanel()
    }
	
	// Clear Downloads
	@objc func clearDownloads(sender: NSMenuItem) {
		let link = sender.representedObject as! String
		guard let url = URL(string: link) else { return }
		NSWorkspace.shared.open(url)
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
    
    // Toggle default browser
    @objc func runPythonScript(sender: NSMenuItem) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/python3")  // Path to Python executable
        task.arguments = ["/Users/connor/Misc./Coding/Python/toggleBrowser/main.py"]  // Replace with your script's path

        let pipe = Pipe()
        task.standardOutput = pipe

        if defaultBrowser == "Safari" {
            defaultBrowser = "Firefox"
            showDefaultBrowser.title = "Default Browser: \(defaultBrowser)"
            print(defaultBrowser)
        } else if defaultBrowser == "Firefox" {
            defaultBrowser = "Safari"
            showDefaultBrowser.title = "Default Browser: \(defaultBrowser)"

            print(defaultBrowser)
        }
        
        do {
            try task.run()
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {
                print(output)
            }
        } catch {
            print("Error running Python script: \(error)")
        }
    }
    
}
