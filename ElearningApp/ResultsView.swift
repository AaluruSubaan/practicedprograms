//
//  ResultsView.swift
//  ElearningApp
//
//  Created by admin on 15/02/25.
//

import SwiftUI

struct ResultsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ExamResult.entity(),sortDescriptors: []) private var results:FetchedResults<ExamResult>
    var body: some View {
        NavigationView{
            List(results,id: \.self){result in VStack(alignment: .leading){
                Text("subject: \(result.subject?.name ?? "Unknown")")
                Text("Score:\(result.score)/\(result.totalquestions)")
                Text("Date: \(result.date ?? Date(),formatter: dateFormatter)")
            }}
            .navigationTitle("ExamResults")
        }
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
