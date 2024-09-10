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
    var windows: [NSWindow] = []

    func applicationDidFinishLaunching(_ notification: Notification) {
        print("Application did finish launching")

        // Create status item
        setupStatusItem()

        // Set up the main window
        // setupMainWindow()

        // Set activation policy to accessory
        NSApp.setActivationPolicy(.accessory)
        print("Set activation policy to accessory")

        createNewNote()
    }

    func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "note.text", accessibilityDescription: "Sticky Lyrics")
            button.action = #selector(toggleWindowVisibility)
            button.target = self
        }
    }


    // func setupMainWindow() {
    //     let contentView = ContentView()
    //     let panel = NSPanel(
    //         contentRect: NSRect(x: 100, y: 100, width: 300, height: 200),
    //         styleMask: [.nonactivatingPanel, .titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
    //         backing: .buffered,
    //         defer: false
    //     )
    //     panel.contentView = NSHostingView(rootView: contentView)
    //     panel.title = "StickEase"
    //     panel.level = .floating
    //     panel.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
    //     panel.isFloatingPanel = true
    //     panel.hidesOnDeactivate = false
    //     panel.isMovableByWindowBackground = true
    //     panel.titlebarAppearsTransparent = true
    //     panel.titleVisibility = .hidden
    //     panel.isReleasedWhenClosed = false
    //     panel.setContentSize(NSSize(width: 300, height: 200))
    //     panel.minSize = NSSize(width: 300, height: 200)
    //     panel.maxSize = NSSize(width: 600, height: 400)

    //     self.windows = panel
    //     panel.makeKeyAndOrderFront(nil)
    //     print("Main window configured")
    // }

    func createNewNote() {
        let contentView = ContentView()
        let panel = NSPanel(
            contentRect: NSRect(x: 100, y: 100, width: 300, height: 200),
            styleMask: [.nonactivatingPanel, .titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        panel.contentView = NSHostingView(rootView: contentView)
        panel.title = "StickEase"
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

        windows.append(panel)
        panel.makeKeyAndOrderFront(nil)
        print("New note created")
    }

    @objc func toggleWindowVisibility() {
        if let window = windows.last {
            if window.isVisible {
                window.orderOut(nil)
            } else {
                window.makeKeyAndOrderFront(nil)
            }
        }
    }

    @objc func createNewNoteFromMenu() {
        createNewNote()
    }
}
