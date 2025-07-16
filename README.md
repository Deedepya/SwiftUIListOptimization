# 📚 SwiftUI Book List – Three Tabs, Three State Management Techniques

This SwiftUI project demonstrates three approaches to state management through separate tabs, each showing a book list where users can increase the quantity of individual books. Each tab progressively introduces a more scalable and performance friendly pattern using SwiftUI’s **`@State`**, **`@ObservedObject`**, and **`@StateObject`**.

---

## 🔹 Tab 1 – Simple State with Structs

**State Management**  
Uses **`@State`** with value-type `struct` for books and **`@Binding`** in each row.

**Performance**  
Good for simple UIs, but changes cause unnecessary view reloads across the entire list.  
Any change (like incrementing quantity) modifies the array directly and due to it SwiftUI re-evaluates the entire **`ForEach`** block, potentially reloading all visible rows.  
Not optimal for large lists, as even one update may cause unnecessary redraws.

---

## 🔹 Tab 2 – Row-Level Observability with `@ObservedObject`

**State Management**  
Uses reference-type models ie., class (**`AdvancedBookViewModel`**) for each row instead of struct.  
Each row is an **`@ObservedObject`**, listening only to its own changes.

**Performance**  
Only the row whose quantity changes gets reloaded.  
SwiftUI efficiently updates minimal parts of the UI.  
Much better suited for larger and complex lists.

---

## 🔹 Tab 3 – Centralized State with `@StateObject`

**State Management**  
Uses a shared **`BooksViewModel`** with **`@Published`** `books` which contains an array of **`AdvancedBookViewModel`** and **`@Published`** `totalQuantity`.  
TabThreeView View (initial parent view) observes a single source of truth via **`@StateObject`**.

**Performance**  
Minimal and targeted UI updates due to **`AdvancedBookViewModel`** being an **`ObservableObject`** which publishes specific changes.  
SwiftUI only reloads what’s needed. e.g., if the quanity is increased for any book, then only that single row's view gets reloaded and the `Text` for totalQuantity gets reloaded. The greate optimization here is avoiding all rows to reload.
"""
