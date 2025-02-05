//
//  ContentView.swift
//  CounterApp
//
//  Created by admin on 27/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username:String=""
    @State private var password:String=""
    @State private var loginVerification=false
    var body: some View {
        NavigationView{
            Form {
                
                Text("Log in Page")
                TextField("Username",text:$username)
                    .foregroundColor(.brown)
                    .fontWeight(.bold)
                TextField("Password", text: $password)
                    .fontWeight(.bold)
                Button(action:{loginVerification.toggle()}){
                    Text("Login")
                    
                }
                .padding()
            }
               
                .sheet(isPresented:$loginVerification){
                    TrasactionView()
                }
                
                    
                
                
                
                
                
            }
            
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
