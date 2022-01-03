//
//  AddView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 28/12/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "MYR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                saveButton
            }
        }
    }
    
    private var saveButton: some View {
        Button("Save", action: addItem)
    }
    
    
    private func addItem() {
        let item = ExpenseItem(name: name, type: type, amount: amount)
        expenses.items.append(item)
        
        dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
