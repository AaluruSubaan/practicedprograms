//
//  LoginView.swift
//  ElearningApp
//
//  Created by admin on 15/02/25.
//

import SwiftUI
import CoreData

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var showRegistration = false
    @State private var loginError = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView{
            
                Form{
                    Section(header: Text("Login")){
                        TextField("Email",text: $email).keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text:$password)
                    }
                    if !loginError.isEmpty{
                        Text(loginError)
                            .foregroundColor(.red)
                    }
                    Button("Login"){
                        login()
                    }
                    Button("Register"){
                        showRegistration = true
                    }
                }
                .navigationTitle("Login")
                .sheet(isPresented: $showRegistration){
                    RegistrationView()
                }
                .background(NavigationLink(destination:MainView(), isActive: $isLoggedIn){
                    EmptyView()
                }
                )
            }
            
        
    }
        private func login(){
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate =  NSPredicate(format: "email == %@ AND password == %@", email,password)
            do{
                let users = try viewContext.fetch(fetchRequest)
                if let user = users.first{
                    print("Logged in as \(user.email ?? "")")
                    isLoggedIn = true
                }else{
                    loginError = "Invalid email or password"
                }
            }catch{
                loginError = "Error logging in: \(error.localizedDescription)"
            }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
