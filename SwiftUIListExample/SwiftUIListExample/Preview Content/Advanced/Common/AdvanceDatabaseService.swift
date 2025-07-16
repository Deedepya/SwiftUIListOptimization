//
//  BookDatabaseService.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

class AdvanceDatabaseService {
    func fetchBooks() -> [AdvancedBook] {
        return [
            AdvancedBook(name: "1984", quantity: 1),
            AdvancedBook(name: "To Kill a Mockingbird", quantity: 2),
            AdvancedBook(name: "The Great Gatsby", quantity: 0)
        ]
    }
}
