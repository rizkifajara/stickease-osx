//
//  AppDelegate.swift
//  StickEase
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    @Published var windows: [(NSWindow, NoteViewModel)] = []

    override init() {
        super.init()
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        createNewNote()
    }

    func createNewNote() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            print("createNewNote() called in AppDelegate")
            let viewModel = NoteViewModel(appDelegate: self)
            let contentView = ContentView(viewModel: viewModel)
            
            let randomPosition = self.getRandomPosition()
            let panel = NSPanel(
                contentRect: NSRect(x: randomPosition.x, y: randomPosition.y, width: 300, height: 200),
                styleMask: [.nonactivatingPanel, .titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                backing: .buffered,
                defer: false
            )
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

            panel.contentView = NSHostingView(rootView: contentView)
            panel.makeKeyAndOrderFront(nil)
            self.windows.append((panel, viewModel))
            print("New note panel created and displayed")
        }
    }

    func updateNoteVisibility(for viewModel: NoteViewModel, isVisible: Bool) {
        if let index = windows.firstIndex(where: {
            $0.1 === viewModel
        }) {
            let window = windows[index].0
            if isVisible {
                window.orderFront(nil)
            } else {
                window.orderOut(nil)
            }
        }
    }

    func showAllNotes() {
        for(window, viewModel) in windows {
            window.orderFront(nil)
            viewModel.isVisible = true
        }
    }

    func getRandomPosition() -> NSPoint {
        if let screen = NSScreen.main {
            let screenFrame = screen.visibleFrame
            let x = CGFloat.random(in: screenFrame.minX...(screenFrame.maxX - 300))
            let y = CGFloat.random(in: screenFrame.minY...(screenFrame.maxY - 200))
            return NSPoint(x: x, y: y)
        }
        return NSPoint(x: 100, y: 100) // fallback position
    }
}
