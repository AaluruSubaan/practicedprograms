//
//  SubjectView.swift
//  ElearningApp
//
//  Created by admin on 15/02/25.
//

import SwiftUI

struct SubjectView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Subject.entity(), sortDescriptors: []) private var subjects: FetchedResults<Subject>
    var body: some View {
        NavigationView{
            List(subjects, id: \.self){
                subject in NavigationLink(destination:MaterialView(subject: subject)){
                    Text(subject.name ?? "UnknownSubject")
                }
            }
            .navigationTitle("Subjects")
            .toolbar {
                Button("Add Data"){
                    addSampleData()
                }
            }
        }
        
    }
    private func addSampleData(){
        let subjects = Subject(context: viewContext)
        subjects.name = "Mathematics"
        let material = Material(context: viewContext)
        material.title = "BASICS"
        material.url = "htpps://example.com/algebra"
        material.subject = subjects
        let question = Question(context: viewContext)
        question.text = "What is 10+10?"
        question.options = ["3", "20", "4", "6"] as NSObject
        question.correctanswer = "20"
        question.subject = subjects
        
        do{
            try viewContext.save()
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView()
    }
}
