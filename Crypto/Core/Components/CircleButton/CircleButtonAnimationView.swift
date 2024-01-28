//
//  CircleButtonAnimationView.swift
//  Crypto
//
//  Created by John Xavier  on 29/01/2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 0.5)
            .scale(animate ? 1.0 : 0.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
         
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(.red)
        .frame(width: 100,height: 100)
}
