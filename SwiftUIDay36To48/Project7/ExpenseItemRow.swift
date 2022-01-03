//
//  ExpenseItemRow.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 28/12/2021.
//

import SwiftUI

struct ExpenseItemRow: View {
    let item: ExpenseItem
    
    private var amountColor: Color {
        var color: Color = .gray
        
        if item.amount <= 10 {
            color = .green
        } else if item.amount > 10 && item.amount <= 100 {
            color = .orange
        } else if item.amount > 100 {
            color = .red
        }
        
        return color
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "MYR"))
                .font(.headline)
                .foregroundColor(amountColor)
        }
    }
}

struct ExpenseItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemRow(item: ExpenseItem(name: "AD", type: "ad", amount: 150))
    }
}
