//
//  BookListView.swift
//  BookCollectionApp
//
//  Created by admin on 01/02/25.
//

import SwiftUI
import CoreData

struct BookListView: View {
    @Environment(\.managedObjectContext)private var viewContext
    @FetchRequest(entity: BookEntity.entity(),sortDescriptors: []) private var books: FetchedResults<BookEntity>
    @State private var showAddBook  = false
    @State private var Edit :BookEntity?
    @State private var filterReadStatus: Bool? = nil
    var filteredBooks: [BookEntity]{
        if let status = filterReadStatus{
            return books.filter{$0.isRead == status}
        }
        return Array(books)
    }
    var body: some View {
        NavigationView {
            VStack{
                Picker("Filter",selection: $filterReadStatus){
                    Text("All").tag(nil as Bool?)
                    Text("Read").tag(true as Bool?)
                    Text("UnRead").tag(false as Bool?)
                    
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                List{
                    ForEach(filteredBooks){ book in NavigationLink(destination: EditBook(book: book)){
                        HStack{
                            VStack(alignment: .leading){
                                Text(book.title ?? "No title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(book.dateAdded ?? Date(), style: .date)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                            if book.isRead{
                                Text("Read").foregroundColor(.green)
                            }else{
                                Text("Unread").foregroundColor(.red)
                            }
                        }
                    }
                        
                        
                    .swipeActions{
                        Button(role: .destructive){
                            deleteBook(book)}
                    label: {
                        Label("Delete", systemImage: "trash")
                    }
                    }
                    }
                    }
                }
                .navigationTitle("Book Collection")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action:{ showAddBook = true}){
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $showAddBook){
                    AddBookView()
                }
            }
        }
        private func deleteBook(_ book: BookEntity){
            viewContext.delete(book)
            do{
                try viewContext.save()}
            catch{
                print("Error Deleting Book:\(error)")
            }
        }
    }
    


struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}
