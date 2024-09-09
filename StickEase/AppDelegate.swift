//
//  AppDelegate.swift
//  StickEase
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var mainWindow: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Application did finish launching")

        // Create status item
        setupStatusItem()

        // Set up the main window
        setupMainWindow()

        // Set activation policy to accessory
        NSApp.setActivationPolicy(.accessory)
        print("Set activation policy to accessory")
    }

    func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "music.note", accessibilityDescription: "Sticky Lyrics")
            button.action = #selector(toggleWindowVisibility)
            button.target = self
        }
    }


    func setupMainWindow() {
        let contentView = ContentView()
        let panel = NSPanel(
            contentRect: NSRect(x: 100, y: 100, width: 300, height: 200),
            styleMask: [.nonactivatingPanel, .titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        panel.contentView = NSHostingView(rootView: contentView)
        panel.title = "Sticky Lyrics"
        panel.level = .floating
        panel.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        panel.isFloatingPanel = true
        panel.hidesOnDeactivate = false
        panel.isMovableByWindowBackground = true
        panel.titlebarAppearsTransparent = true
        panel.titleVisibility = .hidden
        panel.isReleasedWhenClosed = false
        panel.setContentSize(NSSize(width: 300, height: 200))
        panel.minSize = NSSize(width: 300, height: 200)
        panel.maxSize = NSSize(width: 600, height: 400)

        self.mainWindow = panel
        panel.makeKeyAndOrderFront(nil)
        print("Main window configured")
    }

    @objc func toggleWindowVisibility() {
        if let window = mainWindow {
            if window.isVisible {
                window.orderOut(nil)
            } else {
                window.makeKeyAndOrderFront(nil)
            }
        }
    }
}
