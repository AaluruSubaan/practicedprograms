//
//  RegistrationView.swift
//  ElearningApp
//
//  Created by admin on 15/02/25.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var registrationError = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Registration")){
                    TextField("Email", text: $email).keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("password",text:$password)
                    SecureField("Confirm Password", text: $confirmPassword)

                }
                if !registrationError.isEmpty{
                    Text(registrationError)
                        .foregroundColor(.red)
                }
                Button("Register"){
                    register()
                }
                Button("Already have an account? Please Login"){
                    dismiss()
                }
                
            }.navigationTitle("Register")
        }
    }
    private func  register(){
        guard password == confirmPassword else{
            registrationError = "Password donot match"
            return
        }
        let newUser = User(context: viewContext)
        newUser.email = email
        newUser.password = password
        do{
            try viewContext.save()
            dismiss()
        }
        catch{
            registrationError = "Error register: \(error.localizedDescription)"
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
