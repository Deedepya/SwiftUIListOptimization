//
//  BooksList.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//
import SwiftUI

struct TabThreeView: View {
    @StateObject private var booksVM: BooksViewModel
    
    init() {
        let db = AdvanceDatabaseService()
        let rawBooks = db.fetchBooks()
        let advBooksVM = rawBooks.map { AdvancedBookViewModel(book: $0) }
        _booksVM = StateObject(wrappedValue: BooksViewModel(books: advBooksVM))
    }
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            Text("Total Quantity: \(booksVM.totalQuantity)")
                .font(.title)
                .padding()
            
            NavigationView {
                List {
                    ForEach(booksVM.books) { book in
                        AdvancedBookRowView(book: book)
                    }
                }
                .navigationTitle("Book List Tab 2")
            }
        }
    }
}

