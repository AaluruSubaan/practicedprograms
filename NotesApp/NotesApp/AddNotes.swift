//
//  AddNotes.swift
//  NotesApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct AddNotes: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var content = ""
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Add Note Detail" )){
                    TextField("Enter Title ", text:$title)
                    TextField("Enter the Content",text: $content)
                }
            }
            .navigationTitle("AddNote")
            .navigationBarItems(leading: Button("cancel"){ dismiss()},
                                trailing: Button("Save"){
                saveNote()
                dismiss()
            }.disabled(title.isEmpty || content.isEmpty))
        }
    }
    private func saveNote(){
        let newNote = Note(context: viewContext)
        newNote.title = title
        newNote.content = content
        newNote.datecreated = Date()
        do{
            try viewContext.save()}
        catch{
            print("Error Saving Note: \(error)")
        }
    }
}

struct AddNotes_Previews: PreviewProvider {
    static var previews: some View {
        AddNotes()
    }
}
