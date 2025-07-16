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
        let db = BookDatabaseService()
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
                        AdvancedBookRow(book: book)
                    }
                }
                .navigationTitle("Book List Tab 2")
            }
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
                book.increamentQuantity()
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
class BooksViewModel: ObservableObject {
    @Published var books: [AdvancedBookViewModel] = []
    @Published private(set) var totalQuantity: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init(books: [AdvancedBookViewModel]) {
        self.books = books
        
        // Subscribe to each book's quantity changes to recalc total
        for book in books {
            book.$quantity
                .sink { [weak self] _ in
                    self?.recalculateTotal()
                }
                .store(in: &cancellables)
        }
        
        recalculateTotal()
    }
    
    private func recalculateTotal() {
        totalQuantity = books.reduce(0) { $0 + $1.quantity }
    }
}

class AdvancedBookViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let name: String
    @Published var quantity: Int

    init(book: AdvancedBook) {
        self.name = book.name
        self.quantity = book.quantity
    }
    
    func increamentQuantity() {
        quantity += 1
    }
}
