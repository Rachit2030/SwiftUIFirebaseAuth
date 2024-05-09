//
//  RegistrationView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Rachit on 09/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
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
                    
                    InputView(text: $fullName,
                              title: "Full Name",
                              placeholder: "Enter Your Name")
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                    ZStack(alignment:.trailing) {
                        InputView(text: $confirmPassword,
                                  title: "Confirm Password",
                                  placeholder: "Confirm your password",
                                  isSecureField: true)
                        
                        if(!password.isEmpty && !confirmPassword.isEmpty){
                            if(password == confirmPassword){
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.green
                                    )
                            }else{
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                        
                }.padding(.horizontal)
                    .padding(.top,24)
                
                // Sign IN Button
                
                Button{
                    Task{
                        try await viewmodel.createUser(withEmail: email, password: password, fullName:fullName)
                    }
                }label: {
                    HStack{
                        Text("Sign Up")
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
                
                Button {
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have an account")
                        Text("Sign In")
                            .fontWeight(.bold)
                    }.font(.system(size: 14))
                }

            }
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5 && !fullName.isEmpty && password == confirmPassword
    }
}

#Preview {
    RegistrationView()
}
