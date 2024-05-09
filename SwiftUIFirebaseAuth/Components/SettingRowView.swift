//
//  SettingRowView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Rachit on 09/05/24.
//

import SwiftUI

struct SettingRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    var body: some View {
        HStack(spacing:12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(Color(tintColor))
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    SettingRowView(imageName: "gear", title: "Version", tintColor: Color.gray)
}
