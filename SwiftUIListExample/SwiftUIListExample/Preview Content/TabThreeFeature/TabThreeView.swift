//
//  TabThreeView.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//
import SwiftUI

struct TabThreeView: View {
    @State private var books: [AdvancedBookViewModel]

    init() {
        let db = BookDatabaseService()
        let rawBooks = db.fetchBooks()
        _books = State(initialValue: rawBooks.map { AdvancedBookViewModel(book: $0) })
    }

    var body: some View {
        let _ = Self._printChanges()
        
        NavigationView {
            List {
                ForEach(books) { book in
                    AdvancedBookRow(book: book)
                }
            }
            .navigationTitle("Book List Tab 2")
        }
    }
}
