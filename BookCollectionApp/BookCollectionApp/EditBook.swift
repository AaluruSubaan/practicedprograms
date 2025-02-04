//
//  EditBook.swift
//  BookCollectionApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI

struct EditBook: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var book:BookEntity
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var isRead = false
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Book Details")){
                    TextField("TitleName" ,text:$title)
                    TextField("Author", text:$author)
                    TextField("Genre", text:$genre)
                    Toggle("Read", isOn:$isRead)
                }
            }
            .navigationTitle("Edit Book")
            .navigationBarItems(leading: Button("Cancel"){
                dismiss()
            }, trailing:Button("Save"){
                updateBook()
                dismiss()
            }).onAppear{
                title = book.title ?? ""
                author = book.author ?? ""
                genre = book.genre ?? ""
                isRead = book.isRead
            }
        }
        
    }
    private func updateBook(){
        book.title = title
        book.author = author
        book.isRead = isRead
        book.genre = genre
    }
}

