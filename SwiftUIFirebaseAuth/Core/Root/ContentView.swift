//
//  ContentView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Rachit on 09/05/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewmodel: AuthViewModel
    var body: some View {
        Group{
            if(viewmodel.userSession != nil){
                ProfileView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView().environmentObject(AuthViewModel())
}
