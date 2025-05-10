//
//  ListViewModel.swift
//  TodoListPaul
//
//  Created by Paul Norris on 5/6/25.
//

import Foundation

/*
 CRUD Functions
 Create
 Read
 Update
 Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems()  {
//        let newItems = [
//            ItemModel(title: "Buy milk", isCompleted: false),
//            ItemModel(title: "Learn SwiftUI", isCompleted: true),
//            ItemModel(title: "Go for a walk", isCompleted: false),
//            
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
        }
        
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int)  {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String)  {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel)    {
        
        //        Code below does the same thing more succinctly
        if items.firstIndex(where: { (existingItem) -> Bool in
            return existingItem.id == item.id
        }) != nil{
                    // run this code
                }
        
//          This is more succinct but gives me an error
//        if let index = items.firstIndex(where: { 0$.id == item.id }) {
//            items[index] = item.updateCompletion()
        }
    
    func saveItems()  {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    }
