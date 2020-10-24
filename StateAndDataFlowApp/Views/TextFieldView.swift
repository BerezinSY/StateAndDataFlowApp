//
//  TextFieldView.swift
//  StateAndDataFlowApp
//
//  Created by BEREZIN Stanislav on 24.10.2020.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var name: String
    
    var placeHolder: String = ""
    var onCommit: () -> () = { }
    

    var body: some View {
        TextField(placeHolder, text: $name, onCommit: onCommit)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 150)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(name: .constant("Your Name"))
    }
}
