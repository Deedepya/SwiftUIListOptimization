//
//  AdvancedBookRow.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

import SwiftUI

struct AdvancedBookRowView: View {
    @ObservedObject var book: AdvancedBookViewModel
    
    var body: some View {
        let _ = Self._printChanges()
        
        HStack {
            VStack(alignment: .leading) {
                Text(book.name).font(.headline)
                Text("Quantity: \(book.quantity)").font(.subheadline)
            }
            Spacer()
            Button(action: {
                book.increamentQuantity()
            }) {
                Image(systemName: "plus.circle").font(.title2)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 5)
    }
}
