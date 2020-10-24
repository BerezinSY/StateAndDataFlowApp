//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    
    @Published var isRegister = UserDefaults.standard.bool(forKey: "isRegister")
    
    var name = UserDefaults.standard.string(forKey: "name")
    let logoutButtonTitle = "Logout"
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}

extension UserManager {
    
    func save() {
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(isRegister, forKey: "isRegister")
    }
    
    func delete() {
        UserDefaults.standard.removeObject(forKey: "name")
        isRegister = false
        save()
    }
    
    func setName() -> String {
        return isValidName() ? name!: ""
    }
    
    private func isValidName() -> Bool {
        name != nil
    }
}
