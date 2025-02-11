//
//  PortfolioViewModel.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import Foundation
import Combine

final class PortfolioViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Bind to the shared data manager's published items
        ItemDataManager.shared.$items
            .receive(on: RunLoop.main)
            .assign(to: \.items, on: self)
            .store(in: &cancellables)
    }
    
    func addNewItem(name: String, condition: String, marketValue: Double) {
        let newItem = Item(name: name, condition: condition, marketValue: marketValue, acquiredDate: Date())
        ItemDataManager.shared.addItem(newItem)
    }
    
    // Other business logic functions here
}
