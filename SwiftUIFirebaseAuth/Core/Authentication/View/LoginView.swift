//
//  LoginView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Rachit on 09/05/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewmodel: AuthViewModel
    var body: some View {
        NavigationStack {
            VStack{
                
                //Image
                Image("firebase-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120,height: 150)
                    .padding(.vertical,32)
                
                // Form Fields
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                        .autocorrectionDisabled()
                    
                    InputView(text: $password, 
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                        
                }.padding(.horizontal)
                    .padding(.top,24)
                
                // Sign IN Button
                
                Button{
                    Task{
                       try await viewmodel.signIn(withEmail: email, password: password)
                    }
                }label: {
                    HStack{
                        Text("Sign In")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "arrow.right")
                    }.foregroundStyle(.white)
                        .frame(width: UIScreen.main.bounds.size.width - 32,height: 48)
                }.background(Color(.systemBlue))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top,24)
                Spacer()
                
                // Sign up Button
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Don't have an account")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }.font(.system(size: 14))
                }

            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}

#Preview {
    LoginView().environmentObject(AuthViewModel())
}
