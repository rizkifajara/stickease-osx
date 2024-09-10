//
//  NoteViewModel.swift
//  StickEase
//
//  Created by MacBook Air on 10/09/24.
//

import SwiftUI

class NoteViewModel: ObservableObject {
    @Published var texts: String
    @Published var isVisible: Bool
    weak var appDelegate: AppDelegate?

    init(texts: String = "Click pen to start writing...", appDelegate: AppDelegate, isVisible: Bool = true) {
        self.texts = texts
        self.appDelegate = appDelegate
        self.isVisible = isVisible
    }

    func createNewNote() {
        appDelegate?.createNewNote()
    }

    func toggleVisibility() {
        isVisible.toggle()
        appDelegate?.updateNoteVisibility(for: self, isVisible: isVisible)
    }

}
