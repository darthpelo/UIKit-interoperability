//
//  ViewModel.swift
//  MixInterface
//
//  Created by Alessio Roberto on 18/11/2020.
//

import Foundation

final class ViewModel: ObservableObject {
    let maintitle = "Email"
    @Published var user: User {
        didSet {
            print("user updated")
            print("email: \(user.email)")
            print("name: \(user.name)")
        }
    }

    init(user: User = User()) {
        self.user = user
    }

}

struct User {
    var name: String = ""
    var email: String = ""
}
