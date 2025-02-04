//
//  AddBookView.swift
//  BookCollectionApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI
import CoreData

struct AddBookView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var isRead = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("BookDetails")){
                    TextField("Enter the title", text:$title)
                    TextField("Enter the author name", text:$author)
                    TextField("Genre", text:$genre)
                    Toggle("Read", isOn:$isRead)

                }
            }
            .navigationTitle("Add new Book")
            .navigationBarItems(leading: Button("cancel"){
                dismiss()
            }
                                , trailing: Button("Save"){
                addBook()
                dismiss()
            }.disabled(title.isEmpty || author.isEmpty))
        }
    }
    private func addBook(){
        let newBook = BookEntity(context: viewContext)
        newBook.title = title
        newBook.author = author
        newBook.genre = genre
        newBook.isRead = isRead
        newBook.dateAdded = Date()
        try? viewContext.save()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
