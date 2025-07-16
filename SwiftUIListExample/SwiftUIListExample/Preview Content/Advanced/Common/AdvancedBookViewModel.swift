//
//  adfa.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//
import Combine
import Foundation

class AdvancedBookViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let name: String
    @Published var quantity: Int

    init(book: AdvancedBook) {
        self.name = book.name
        self.quantity = book.quantity
    }
    
    func increamentQuantity() {
        quantity += 1
    }
}
