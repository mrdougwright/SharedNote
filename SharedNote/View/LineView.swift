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

    @State private var expand: Bool = false
    @State private var lines: Int = 1
    @State private var showingSheet = false

    var body: some View {
        Text(text)
            .font(.body)
            .lineLimit(lines)
            .onTapGesture(count: 2) {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                EditView(id: id, newText: text)
            }
            .onTapGesture {
                toggleExpand()
            }
            .animation(.easeIn)
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

    
}

struct EditView: View {
    let id: String
    @State var newText: String
    @Environment(\.presentationMode) var presentationMode
    var viewModel = NotesViewModel()
    
    func updateNote() {
        viewModel.updateNote(documentId: id, text: newText)
    }
    
    func cancel() {
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack {
            TextEditor(text: $newText)
                .padding()

            HStack {
                Button(action: cancel) {
                    Text("Cancel")
                    Image(systemName: "pencil.slash")
                }
                .padding()

                Spacer()
                Button(action: updateNote) {
                    Text("Save")
                    Image(systemName: "square.and.arrow.up")
                }
                .padding()
            }
        }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(id: "s3j23js23", text: Note.testData[2].text)
    }
}
