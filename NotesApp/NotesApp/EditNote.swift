//
//  EditNote.swift
//  NotesApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct EditNote: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var note: Note
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Note")){
                    TextField("Title" , text: $title)
                    TextField("content", text: $content)
                        
                }
            }
            .navigationTitle("Edit Note")
            .navigationBarItems(leading: Button("Cancel"){dismiss()}, trailing: Button("Save"){
                note.title = title
                note.content = content
                saveContext()
                dismiss()
            } .disabled(title.isEmpty || content.isEmpty))
            .onAppear{
                title = note.title ?? ""
                content = note.content ?? ""
            }
        }
        
    }
    private func saveContext(){
        do{
            try viewContext.save()}
                catch {
                    print("Error Saving Edit: \(error)")
                }
            }
        
}
