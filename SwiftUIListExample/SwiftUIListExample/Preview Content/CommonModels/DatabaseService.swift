//
//  BookDatabaseService.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

class BookDatabaseService {
    func fetchBooks() -> [AdvancedBook] {
        return [
            AdvancedBook(name: "1984", quantity: 1),
            AdvancedBook(name: "To Kill a Mockingbird", quantity: 2),
            AdvancedBook(name: "The Great Gatsby", quantity: 0)
        ]
    }
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
