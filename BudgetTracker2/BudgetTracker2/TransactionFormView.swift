//
//  TransactionFormView.swift
//  BudgetTracker2
//
//  Created by admin on 29/01/25.
//

import SwiftUI

struct TransactionFormView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: TransactionViewModel
    @State private var title : String = ""
    @State private var amount : String = ""
    @State private var type :Transaction.TransactionType = .expense
    var transaction : Transaction?
    var transactionIndex: Int?
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Transaction Details")){
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Amount ", text: $amount)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Picker("Type", selection: $type){
                        ForEach(Transaction.TransactionType.allCases){
                            transactionType in
                            Text(transactionType.rawValue).tag(transactionType)
                        }
                    }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                Button(action: saveTransaction){
                    Text(transaction != nil ? "Update Transaction" : "Add Transaction")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(9)
                }.padding()
            }
            .onAppear{
                loadTransactionData()
            }
            .navigationTitle(transaction != nil ? "Edit Transaction ": "Add Transaction")
        }
        private func saveTransaction(){
            guard let amountValue = Double(amount) else { return }
                let newTransaction = Transaction(title: title, amount: amountValue, type: type)
                if let index = transactionIndex{
                    viewModel.updateTransaction(newTransaction, at: index)
                }
            else{
                viewModel.addTransaction(newTransaction)
                }
            presentationMode.wrappedValue.dismiss()
        }
        private func loadTransactionData(){
            if let transaction = transaction{
                title = transaction.title
                amount = String(transaction.amount)
                type = transaction.type
            }
        }
    }

