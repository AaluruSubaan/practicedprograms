//
//  TransactionFormView.swift
//  BudgetTrackerApp
//
//  Created by admin on 28/01/25.
//

import SwiftUI

struct TransactionFormView: View {
    @EnvironmentObject var transactionStore : TransactionStore
    @Environment(\.presentationMode) var presentationMode
    @State private var amount:String=""
    @State private var category:String="Income"
    @State private var description:String=""
    let categories=["Income","Expense"]
    var body: some View {
        Form{
            Section(header:Text("Transaction Details")){
                TextField("Amount",text: $amount).keyboardType(.decimalPad)
                TextField("Description", text: $description)
                Picker("Category",selection:$category){
                    ForEach(categories,id:\.self){
                        cat in Text(cat)
                    }
                }
                Button(action:{saveTransactions()}){
                    Text("Save Transaction")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
            }
            .navigationTitle("New Transactions")
            .navigationBarBackButtonHidden(false)
            
            }
        }
    func saveTransactions(){
        guard let transactionAmount=Double(amount)else{
            print("Invalid amount")
            return
        }
        let transaction = Transaction (amount: transactionAmount,category: category, description: description )
        print("Saved Transaction :\(transaction)")
        print("Before Saving : \(transactionStore.transactions)")
        transactionStore.transactions.append(transaction)
        print("After Saving: \(transactionStore.transactions)")
        presentationMode.wrappedValue.dismiss()
        
        
    }
}

struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView()
    }
}
