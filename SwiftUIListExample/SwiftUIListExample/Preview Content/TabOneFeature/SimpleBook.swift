//
//  Book.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

import Foundation

struct SimpleBook: Identifiable {
    let id = UUID()
    let name: String
    var quantity: Int
}

class SimpleBookDatabase {
    func fetchBooks() -> [SimpleBook] {
        return [
            SimpleBook(name: "1984", quantity: 1),
            SimpleBook(name: "To Kill a Mockingbird", quantity: 2),
            SimpleBook(name: "The Great Gatsby", quantity: 0)
        ]
    }
}
