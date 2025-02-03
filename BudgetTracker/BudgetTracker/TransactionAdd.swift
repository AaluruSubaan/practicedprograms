//
//  TransactionAdd.swift
//  BudgetTracker
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct TransactionAdd: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var desc = ""
    @State private var amount = ""
    @State private var category = "expense"
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Transactions Details")){
                    TextField("Enter Description", text: $desc)
                    TextField("Enter the amount", text: $amount)
                    Picker("Category", selection: $category){
                        Text("Income").tag("income")
                        Text("Expense").tag("expense")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
            }
            .navigationBarTitle("Add new Transaction", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel"){
                dismiss()
            },
                    trailing: Button("Save"){
                addTransaction()
                dismiss()
            }
                .disabled(amount.isEmpty || desc.isEmpty)
            )
            
        }
    }
    private func addTransaction(){
        let newTransaction = Transaction(context: viewContext)
        newTransaction.id = UUID()
        newTransaction.desc = desc
        newTransaction.category = category
        
        if let isDouble = Double(amount){
            newTransaction.amount = isDouble
        }
        else{
            newTransaction.amount = 0.0
        }
        do{
            try viewContext.save()
            desc = ""
            amount = ""
            category = ""
        }catch{
            print("Error Saving Transactions:\(error)")
            
        }
        
    }
}

struct TransactionAdd_Previews: PreviewProvider {
    static var previews: some View {
        TransactionAdd()
    }
}
