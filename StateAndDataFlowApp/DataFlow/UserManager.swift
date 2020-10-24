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
    
    var name = UserDefaults.standard.value(forKey: "name")
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
        UserDefaults.standard.set(isRegister, forKey: "isRegister")
    }
    
    func setName() -> String {
        if isValidName() {
            return name as! String
        } else {
            return ""
        }
    }
    
    private func isValidName() -> Bool {
        name != nil
    }
}
