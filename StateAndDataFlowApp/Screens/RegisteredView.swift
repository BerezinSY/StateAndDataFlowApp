//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextFieldView(name: $name,
                              placeHolder: "Enter your name",
                              onCommit: registerUser)
                TextView(title: "\(name.count)", color: setColor())
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }.disabled(isNotEnoughCharacters())
        }
    }
}

extension RegisteredView {
    private func registerUser() {
        if !name.isEmpty && !isNotEnoughCharacters() {
            user.name = name
            user.isRegister = true
            user.save()
        }
    }
    
    private func isNotEnoughCharacters() -> Bool {
        name.count < 3
    }
    
    private func setColor() -> Color {
        if isNotEnoughCharacters() {
            return .red
        } else {
            return .green
        }
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}
