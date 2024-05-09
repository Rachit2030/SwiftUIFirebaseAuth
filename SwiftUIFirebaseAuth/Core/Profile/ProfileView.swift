//
//  ProfileView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Rachit on 09/05/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewmodel: AuthViewModel
    
    var body: some View {
        if let user = viewmodel.currentUser{
            List{
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72,height: 72)
                            .background(Color(.systemGray))
                            .clipShape(Circle())
                        
                        
                        VStack(alignment: .leading,spacing:4){
                            Text(user.fullname)
                                .fontWeight(.semibold)
                                .font(.subheadline)
                                .padding(.top,4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    
                }
                Section("General") {
                    HStack {
                        SettingRowView(imageName: "gear", title: "version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(Color(.systemGray))
                    }
                    
                }
                Section("Account") {
                    
                    Button{
                        viewmodel.signOut()
                    }label: {
                        SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: Color(.red))
                    }
                    
                    Button{
                        
                    }label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.red))
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ProfileView().environmentObject(AuthViewModel())
}
