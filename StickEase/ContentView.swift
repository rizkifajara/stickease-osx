//
//  ContentView.swift
//  StickEase
//
//  Created by MacBook Air on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var lyrics = "Your lyrics will appear here..."
    @State private var isEditing = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                if isEditing {
                    TextEditor(text: $lyrics)
                        .font(.custom("Helvetica Neue", size: 14))
                        .padding(4)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(8)
                } else {
                    ScrollView {
                        Text(lyrics)
                            .padding()
                            .frame(minHeight: geometry.size.height - 60)
                    }
                }

                Spacer(minLength: 10)

                HStack {
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Image(systemName: isEditing ? "eye" : "pencil")
                        Text(isEditing ? "View" : "Edit")
                            .font(.custom("Helvetica Neue", size: 14))
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .frame(minWidth: 200, minHeight: 100)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color(red: 0.2, green: 0.2, blue: 0.25))
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
