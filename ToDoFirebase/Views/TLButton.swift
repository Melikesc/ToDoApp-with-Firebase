//
//  TLButton.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI

// Özelleştirilmiş buton bileşeni
struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(background)
                    
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                        
            }
        }
        .padding()

    }
}


#Preview {
    TLButton(title: "value", background: .pink){
        //action
    }
}
