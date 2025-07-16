//
//  SimpleDatabaseService.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

class SimpleDatabaseService {
    func fetchBooks() -> [SimpleBook] {
        return [
            SimpleBook(name: "1984", quantity: 1),
            SimpleBook(name: "To Kill a Mockingbird", quantity: 2),
            SimpleBook(name: "The Great Gatsby", quantity: 0)
        ]
    }
}
