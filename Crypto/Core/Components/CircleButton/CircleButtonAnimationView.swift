//
//  CircleButtonAnimationView.swift
//  Crypto
//
//  Created by Yuri Petrosyan on 26/11/2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scaleEffect(animate ? 1.0 : 0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
        
     
           
    }
    
    
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100 , height:  100)
}
