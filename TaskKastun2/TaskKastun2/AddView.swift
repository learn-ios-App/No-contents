//
//  AddView.swift
//  TaskKastun2
//
//  Created by 渡邊 翔矢 on 2023/11/26.
//

import Foundation
import SwiftUI


struct AddView: View {
    
    @State private var inputText:String = ""
    @Environment(\.dismiss) private var dismiss
    @Binding var taskData: [TodoItem]

    
    var body: some View {
        
        NavigationStack{
            TextField("ここにメモを書いて下さい。", text: $inputText)
                .font(.title)
                .background(Color.primary)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .navigationTitle("Add Word")
                .toolbar{
                    ToolbarItem(placement: .cancellationAction) {
                        Button("cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("save") {
                            let newItem = TodoItem(title: inputText, completed: false)
                            taskData.append(newItem)
                            dismiss()
                        }
                    }
                }
        }
    }
}



#Preview {
    AddView(taskData: .constant([]))
}
