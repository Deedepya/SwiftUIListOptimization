//
//  ContentView.swift
//  SwiftUIListExample
//
//  Created by Dedeepya Salla on 7/15/25.
//
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let _ = Self._printChanges()
        TabView {
            TabOneView()
                .tabItem {
                    Label("Tab 1", systemImage: "book")
                }

            TabTwoView()
                .tabItem {
                    Label("Tab 2", systemImage: "book.fill")
                }
        }
    }
}
