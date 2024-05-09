//
//  User.swift
//  SwiftUIFirebaseAuth
//
//  Created by Rachit on 09/05/24.
//

import Foundation

struct User: Identifiable,Codable{
    let id: String
    let fullname: String
    let email: String
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
}

extension User{
    static var MOCL_USER = User(id: NSUUID().uuidString, fullname: "Virat Kohli", email: "viratkohli@gmail.com")
}
