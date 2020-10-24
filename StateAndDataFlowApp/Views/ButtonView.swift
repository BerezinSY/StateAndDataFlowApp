//
//  ButtonView.swift
//  StateAndDataFlowApp
//
//  Created by BEREZIN Stanislav on 24.10.2020.
//

import SwiftUI

struct ButtonView: View {
    
    @ObservedObject var timer: TimeCounter
    let title: String
    let color: Color
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(timer: TimeCounter(), title: "Button", color: Color.red, action: {})
    }
}
