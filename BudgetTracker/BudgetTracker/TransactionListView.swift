//
//  TransactionListView.swift
//  BudgetTracker
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct TransactionListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Transaction.entity(),
                  sortDescriptors: []) private var transactions: FetchedResults<Transaction>
    @State private var showAddview = false
    @State private var TransactionEdit: Transaction?
    var balance : Double{
        transactions.reduce(0){ res , transaction in if transaction.category == "income"{
            return res +  transaction.amount
        }
            else if transaction.category == "expense"{
                return res - transaction.amount
            }
            return res
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Balance").font(.title)
                    Text("$\(balance, specifier: "%.2f")")
                        .font(.title)
                        .foregroundColor(balance>0  ?.green:.red)
                        .padding()
                }
                List{
                    ForEach(transactions){
                        transaction in NavigationLink(destination: EditTransaction(transaction: transaction)){
                            HStack{
                            VStack(alignment:.leading){
                                Text("\(transaction.amount,  specifier: "%.2f")").font(.headline)
                                Text(transaction.desc ?? "No Descripion")
                                    .font(.subheadline)
                                    .foregroundColor(.brown)
                                Text(transaction.category ?? "No Category").font(.caption)
                                    .foregroundColor(transaction.category ==
                                "income" ?.green : .red)
                                    
                                }
                            }
                            
                        }
                        .buttonStyle(PlainButtonStyle()).swipeActions{
                            Button(role: .destructive){
                                deleteTransaction(transaction)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }.navigationTitle("All Transactions")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action :{
                            showAddview = true
                        }){
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $showAddview){
                    TransactionAdd()
                }
        }
    }
    private func deleteTransaction(_ transaction: Transaction){
        viewContext.delete(transaction)
        do{
            try viewContext.save()
        }catch{
            print("Error Deleting Transactions: \(error)")
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
