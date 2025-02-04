//
//  ContentView.swift
//  BudgetTracker2
//
//  Created by admin on 28/01/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = TransactionViewModel()
    var body: some View {
        NavigationView{
            VStack {
                BalanceSummaryView(balance: viewModel.balance, income:viewModel.totalIncome, expenses: viewModel.totalExpenses)
                NavigationLink("View Transactions", destination: TransactionListView(viewModel: viewModel))
                    .padding()
                NavigationLink("Add Transaction", destination: TransactionFormView(viewModel: viewModel))
                    .padding()
                Spacer()
            }
            .navigationTitle("Dashboard")
            .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
