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

    var body: some Scene {
        Settings {
            EmptyView()
        }
        MenuBarExtra("StickEase", systemImage: "note.text") {
            Button("New Note") {
                appDelegate.createNewNote()
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
