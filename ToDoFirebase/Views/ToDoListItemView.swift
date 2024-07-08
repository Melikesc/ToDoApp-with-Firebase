//
//  ToDoListItemView.swift
//  ToDoFirebase
//
//  Created by Melike Sultan CAN on 5.07.2024.
//

import SwiftUI

// Tek bir yapılacaklar listesi öğesi için görünüm
struct ToDoListItemView: View {
    
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading ){
    
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
            
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123",
        title: "süt al",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false ))
}
