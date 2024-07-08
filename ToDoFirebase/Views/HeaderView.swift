//
//  HeaderView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI

// Üst bilgi görünümü, başlık ve alt başlık içerir
struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    
    
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top,80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "title", subtitle: "subtitle", angle: 15, background: .blue)
}
