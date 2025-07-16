//
//  TabTwoExtra.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//
import SwiftUI

struct TabTwoExtraView: View {
    @State private var totalQuantity: Int = 0
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            Button("ince") {
                totalQuantity = totalQuantity + 1
            }
            Text("Total Quantity: \(totalQuantity)")
                .font(.title)
                .padding()
            
            AdvancedBookList()
        }
    }
}

struct AdvancedBookList: View {
   // private var booksVM: BooksViewModelN
    @State var books: [AdvancedBookViewModel]
    
    init() {
        let db = BookDatabaseService()
        let rawBooks = db.fetchBooks()
        let advBooksVM = rawBooks.map { AdvancedBookViewModel(book: $0) }
        let booksVM = BooksViewModelN(books: advBooksVM)
        _books = State(initialValue: booksVM.books)
    }
    
    var body: some View {
        let _ = Self._printChanges()
        
        NavigationView {
            List {
                ForEach(books) { book in
                    AdvancedBookRowN(book: book)
                }
            }
            .navigationTitle("Book List Tab 2")
        }
    }
}

struct AdvancedBookRowN: View {
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

import Combine

// Observable container holding all books and publishing total quantity
class BooksViewModelN {
    @Published var books: [AdvancedBookViewModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(books: [AdvancedBookViewModel]) {
        self.books = books
    }
}
