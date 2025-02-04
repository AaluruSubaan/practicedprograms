//
//  TransactionViewModel.swift
//  BudgetTracker2
//
//  Created by admin on 29/01/25.
//

import Foundation
struct Transaction: Identifiable{
    let id = UUID()
    var title : String
    var amount : Double
    var type : TransactionType
    
    enum TransactionType : String, CaseIterable, Identifiable{
        case income = "Income"
        case expense = "Expense"
        var id : String {rawValue}
    }
    
}

class TransactionViewModel : ObservableObject{
    @Published var transactions : [Transaction] = []
    
    var balance : Double{
        let income = transactions.filter { $0.type == .income }.map {
            $0.amount }.reduce(0, +)
        let expenses = transactions.filter { $0.type == .expense}.map{
            $0.amount }.reduce (0, +)
        return income - expenses
        }
    var totalIncome : Double{
        transactions.filter { $0.type == .income }.map { $0.amount}.reduce(0, +)
    }
    var totalExpenses:Double {
        transactions.filter { $0.type == .expense }.map {$0.amount}.reduce(0, +)
    }
    func addTransaction(_ transaction : Transaction){
        transactions.append(transaction)
    }
    func deleteTransaction(at offsets: IndexSet){
        transactions.remove(atOffsets: offsets)
    }
    func updateTransaction(_ transaction: Transaction, at index : Int ){
        transactions[index] = transaction
    }
}
