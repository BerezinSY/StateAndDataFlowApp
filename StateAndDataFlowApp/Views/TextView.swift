//
//  TextView.swift
//  StateAndDataFlowApp
//
//  Created by BEREZIN Stanislav on 24.10.2020.
//

import SwiftUI

struct TextView: View {
    
    let title: String
    var font: Font = .body
    var color: Color = .black
    var offsetX: CGFloat = 0
    var offsetY: CGFloat = 0
    
    var body: some View {
        Text(title)
            .font(font)
            .fontWeight(.thin)
            .foregroundColor(color)
            .offset(x: offsetX, y: offsetY)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(title: "TextView")
    }
}
