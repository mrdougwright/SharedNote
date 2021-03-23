//
//  EditView.swift
//  SharedNote
//
//  Created by Doug Wright on 3/23/21.
//

import SwiftUI

struct EditView: View {
    let id: String
    @State var newText: String
    @Environment(\.presentationMode) var presentationMode
    var viewModel = NotesViewModel()
    
    func updateNote() {
        viewModel.updateNote(documentId: id, text: newText)
        cancel()
    }
    
    func cancel() {
        presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        VStack {
            Section(header:
                Text("Edit")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
            ) {
                TextEditor(text: $newText)
                    .padding()

                HStack {
                    Button(action: cancel) {
                        Text("Cancel")
                        Image(systemName: "pencil.slash")
                    }
                    .frame(width: 80)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(10)
                    .padding()

                    Spacer()
                    Button(action: updateNote) {
                        Text("Save")
                        Image(systemName: "square.and.arrow.up")
                    }
                    .frame(width: 80)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                }
        }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(id: "s3j23js23", newText: "hello")
    }
}
