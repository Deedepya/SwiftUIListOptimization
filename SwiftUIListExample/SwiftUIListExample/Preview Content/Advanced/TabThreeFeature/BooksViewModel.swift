//
//  BooksViewModel.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//

import Combine

class BooksViewModel: ObservableObject {
    var books: [AdvancedBookViewModel] = []
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
