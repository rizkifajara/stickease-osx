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
    @StateObject private var viewModel: NoteViewModel

    init() {
        let appDelegate = AppDelegate()
        _viewModel = StateObject(wrappedValue: NoteViewModel(appDelegate: appDelegate))
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
        .commands {
            CommandGroup(after: .newItem) {
                Button("New Note") {
                    appDelegate.createNewNote()
                }
                Button("Show All Notes") {
                    appDelegate.showAllNotes()
                }
            }
        }
        MenuBarExtra("StickEase", systemImage: "note.text") {
            Button("New Note") {
                appDelegate.createNewNote()
            }
            Button("Show All Notes") {
                appDelegate.showAllNotes()
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
