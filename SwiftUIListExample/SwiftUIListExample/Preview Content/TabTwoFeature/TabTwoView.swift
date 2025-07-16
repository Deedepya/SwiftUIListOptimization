//
//  BooksList.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//
import SwiftUI

struct TabTwoView: View {
    private var books: [AdvancedBookViewModel]

    init() {
        let db = BookDatabaseService()
        let rawBooks = db.fetchBooks()
        self.books = rawBooks.map { AdvancedBookViewModel(book: $0) }
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

struct AdvancedBookRow: View {
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
                book.quantity += 1
            }) {
                Image(systemName: "plus.circle").font(.title2)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 5)
    }
}
