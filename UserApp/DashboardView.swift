//
//  DashboardView.swift
//  UserApp
//
//  Created by admin on 29/01/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack{
            Text("Welcome To the Dashboard")
                .font(.largeTitle)
                .padding()
            Button("LogOut"){
                logout()
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
    private func logout(){
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
