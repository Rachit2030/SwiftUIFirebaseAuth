//
//  SwiftUIFirebaseAuthApp.swift
//  SwiftUIFirebaseAuth
//
//  Created by Rachit on 09/05/24.
//

import SwiftUI
import Firebase

@main
struct SwiftUIFirebaseAuthApp: App {
    @StateObject var viewmodel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewmodel)
        }
    }
}
