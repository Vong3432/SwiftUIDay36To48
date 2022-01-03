//
//  Project7AppView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 28/12/2021.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

struct Project7AppView: View {
    @StateObject var vm = Expenses()
    @State private var showAddExpenseView = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal expenses") {
                    ForEach(vm.items) { item in
                        if item.type == "Personal" {
                            ExpenseItemRow(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Business expenses") {
                    ForEach(vm.items) { item in
                        if item.type == "Business" {
                            ExpenseItemRow(item: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                addItemButton
            }
        }.sheet(isPresented: $showAddExpenseView) {
            AddView(expenses: vm)
        }
    }
    
    private var addItemButton: some View {
        Button(action: showAddViewSheet) {
            Image(systemName: "plus")
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(18)
        }
    }
    
    private func showAddViewSheet() {
        showAddExpenseView = true
    }
    
    private func removeItems(at offset: IndexSet) {
        vm.items.remove(atOffsets: offset)
    }
}

struct Project7AppView_Previews: PreviewProvider {
    static var previews: some View {
        Project7AppView()
    }
}
