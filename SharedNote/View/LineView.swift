//
//  LineView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/22/21.
//

import SwiftUI

struct LineView: View {
    let id: String
    let text: String
    var viewModel = NotesViewModel()
    @State private var expand: Bool = false
    @State private var lines: Int = 1
    @State private var showingSheet = false

    var body: some View {
        Text(text)
            .font(.body)
            .lineLimit(lines)
            .onTapGesture {
                toggleExpand()
            }
            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
            .onLongPressGesture {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                EditView(newText: text)
            }
    }

    func toggleExpand() {
        if expand {
            lines = 1000
            expand = false
        } else {
            lines = 1
            expand = true
        }
    }

    func updateNote() {
        showingSheet.toggle()
//        viewModel.updateNote(documentId: id, text: newText)
    }
}

struct EditView: View {
    var newText: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(id: "s3j23js23", text: Note.testData[2].text)
    }
}
