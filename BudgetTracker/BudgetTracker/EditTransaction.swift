//
//  EditTransaction.swift
//  BudgetTracker
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct EditTransaction: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var transaction:Transaction
    @State private var amount = ""
    @State private var desc = ""
    @State private var category = ""
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Edit Transaction")){
                    TextField("Edit amount",text:$amount)
                    TextField("Edit desc", text:$desc)
                }
            }.navigationBarTitle("Edit",displayMode: .inline)
                .navigationBarItems(leading: Button("Cancel"){
                    dismiss()
                },
                                    trailing: Button("Update"){
                    if let isdouble = Double(amount){
                        transaction.amount = isdouble
                    }
                    else{transaction.amount=0.0
                    }
                    transaction.desc = desc
                        saveContext()
                        dismiss()
                    }.disabled(desc.isEmpty)
                    
                ).onAppear{
                    amount = String(format: "%.2f",transaction.amount)
                    desc = transaction.desc ?? ""
                }
        }
    }
    private func saveContext(){
        do{
            try viewContext.save()
        }catch{
            print("error saving context: \(error)")
        }
    }
}
