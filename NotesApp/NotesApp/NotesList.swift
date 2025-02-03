//
//  NotesList.swift
//  NotesApp
//
//  Created by admin on 31/01/25.
//

import SwiftUI

struct NotesList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Note.entity(), sortDescriptors: []) private var notes : FetchedResults<Note>
    @State private var showAddView = false
    @State private var EditNotes: Note?
    var body: some View {
        NavigationView{
            Form{
                ForEach(notes){note in NavigationLink(destination: EditNote(note: note)){
                    VStack(alignment:.leading){
                        Text(note.title ?? "No Title").font(.headline)
                        Text(note.content ?? "No Content").font(.subheadline).foregroundColor(.gray)
                        Text(note.datecreated ?? Date(), style: .date).font(.caption)
                    }
                    
                }
                .buttonStyle(PlainButtonStyle())
                .swipeActions {
                    Button(role: .destructive){
                        deleteNote(note)}
                label:{
                    Label("Delete", systemImage: "trash")
                }
                }
                }
                
            }
            .navigationTitle("List of Notes")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showAddView = true
                    }){
                        Image(systemName: "plus")
                    }
                }
            }.sheet(isPresented: $showAddView){
                AddNotes()
            }
        }
    }
    private func deleteNote(_ note: Note){
        
            viewContext.delete(note)
        
        do{
            try viewContext.save()}
        catch{
            print("error deleting note: \(error)")
        }
    }
}

struct NotesList_Previews: PreviewProvider {
    static var previews: some View {
        NotesList()
    }
}
