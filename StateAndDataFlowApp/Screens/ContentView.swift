//
//  ContentView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            TextView(title: "Hi, \(user.setName())!",
                     font: .largeTitle,
                     offsetY: 100)
            TextView(title: "\(timer.counter)",
                     font: .largeTitle,
                     offsetY: 200)
            Spacer()
            VStack(spacing: 70) {
                ButtonView(timer: timer,
                           title: timer.buttonTitle,
                           color: Color.red,
                           action: timer.startTimer)
                ButtonView(timer: timer,
                           title: user.logoutButtonTitle,
                           color: Color.blue,
                           action: user.delete)
            }.offset(x: 0, y: 100)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

