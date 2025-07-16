//
//  TabOneView.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

import SwiftUI

struct TabOneView: View {
    @State private var books: [SimpleBook]

       init() {
           let database = SimpleDatabaseService()
           let fetchedBooks = database.fetchBooks()
           _books = State(initialValue: fetchedBooks)
       }

    var body: some View {
        let _ = Self._printChanges()
        
        NavigationView {
            List {
                ForEach(books.indices, id: \.self) { index in
                    SimpleBookRow(book: $books[index])
                }
            }
            .navigationTitle("Book List Tab 1")
        }
    }
}

struct SimpleBookRow: View {
    @Binding var book: SimpleBook

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

