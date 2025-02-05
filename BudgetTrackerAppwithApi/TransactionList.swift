//
//  TransactionList.swift
//  BudgetTrackerAppwithApi
//
//  Created by admin on 04/02/25.
//

import SwiftUI
import CoreData

struct TransactionList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel: TransactionViewModel
    
    let baseCurrency = "USD"
    init(context: NSManagedObjectContext){
        _viewModel = StateObject(wrappedValue: TransactionViewModel(context: context))
    }
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.transactions, id: \.id) {
                    transaction in
                    VStack(alignment: .leading){
                        Text(transaction.category ?? "Unknown")
                        .font(.headline)
                        if let currency = transaction.currency{
                            let convertedAmount = viewModel.convertAmount(
                            amount: transaction.amount,
                            from: currency,
                            to: baseCurrency
                            )
                            Text("\(transaction.amount, specifier: "%.2f")\(currency)")
                                .font(.subheadline)
                            Text("\(convertedAmount, specifier:"%.2f")\(baseCurrency)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Text(transaction.date ?? Date(), style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                }
                .onDelete(perform: deleteTransaction)
            }
            .navigationTitle("Transactions")
            .toolbar{
                Button(action: {
                    viewModel.addTransaction(amount: 200.0, currency:"EUR", category: "Shopping", note: "Cloths")
                }){
                    Image(systemName: "plus")
                }
            }
        }
    }
    private func deleteTransaction(at offsets: IndexSet){
        
    }
}
