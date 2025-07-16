//
//  AdvancedBook.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

struct AdvancedBook {
    let name: String
    let quantity: Int
}

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
}

class BookDatabaseService {
    func fetchBooks() -> [AdvancedBook] {
        return [
            AdvancedBook(name: "1984", quantity: 1),
            AdvancedBook(name: "To Kill a Mockingbird", quantity: 2),
            AdvancedBook(name: "The Great Gatsby", quantity: 0)
        ]
    }
}
