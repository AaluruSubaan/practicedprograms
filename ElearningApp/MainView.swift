//
//  MainView.swift
//  ElearningApp
//
//  Created by admin on 15/02/25.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var body: some View {
        TabView {
            SubjectView()
                .tabItem{
                    Label("Subjects", systemImage: "Book")
                }
            ResultsView().tabItem{
                Label("Results", systemImage: "chart.bar")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
