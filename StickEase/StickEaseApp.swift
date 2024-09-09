//
//  StickEaseApp.swift
//  StickEase
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI

@main
struct StickEaseApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var isVisible = true

    func toggleWindowVisibility() {
        if let window = NSApp.windows.first {
            if window.isVisible {
                window.orderOut(nil)
            } else {
                window.makeKeyAndOrderFront(nil)
            }
            isVisible = window.isVisible
        }
    }

    var body: some Scene {
        Settings {
            EmptyView()
        }
        // MenuBarExtra("Sticky Lyrics", systemImage: "music.note") {
        //     Button(isVisible ? "Hide" : "Show") {
        //         toggleWindowVisibility()
        //     }
        //     Divider()
        //     Button("Quit") {
        //         NSApplication.shared.terminate(nil)
        //     }
        // }
        // WindowGroup {
        //     ContentView()
        // }
        // .windowStyle(.hiddenTitleBar)
        // .windowResizability(.contentSize)
        // .commands {
        //     CommandGroup(replacing: .newItem) {}
        // }
    }
}
