//
//  MaterialView.swift
//  ElearningApp
//
//  Created by admin on 15/02/25.
//

import SwiftUI

struct MaterialView: View {
    @ObservedObject var subject: Subject
    var body: some View {
        VStack{
            Text("Materials for \(subject.name ?? "")")
                .font(.title)
                .padding()
            List(subject.materials?.allObjects as? [Material] ?? [], id: \.self){
                material in VStack(alignment: .leading){
                    Text(material.title ?? "Unknown")
                    Text(material.url ?? "Nourl")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            NavigationLink(destination: ExamView(subject: subject)){
                Text("Start Exam")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color .blue)
                    .foregroundColor( .white)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
    }
}
