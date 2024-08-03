//
//  InfiniteScrollView.swift
//  EmojiFlow
//
//  Created by Clark Adams on 7/11/24.
//

import SwiftUI

struct InfiniteScrollView: View {
    
    @State private var items: [Item] = []
    @State private var isLoading = false
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items, id: \.id) { item in
                    ZStack {
                        item.view
                            .onAppear {
                                if items.isEmpty || item.id == items.last?.id {
                                    loadItems()
                                }
                            }
                        
                        Text(item.emoji)
                            .font(.system(size: 90))
                            .opacity(0.7)
                    }
                }
                
                if isLoading {
                    ProgressView("Loading...")
                }
            }
            .padding()
        }
        .onAppear {
            loadItems()
        }
    }
    
    private func generateRandomEmoji() -> String {
        return String(UnicodeScalar(Array(0x1F300...0x1F3F0).randomElement()!)!)
    }
    
    private func loadItems() {
        guard !isLoading else { return }
        isLoading = true
        
        //        Simulate loading delay using DispatchQueue
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //            items.append(contentsOf: (0..<16).map { _ in
        //                Item(id: UUID(), view: AnyView(RandomLayoutView()), emoji: generateRandomEmoji())
        //            })
        //            isLoading = false
        //        }
        
        items.append(contentsOf: (0..<16).map { _ in
            Item(id: UUID(), view: AnyView(RandomLayoutView()), emoji: generateRandomEmoji())
        })
        isLoading = false
    }
}

#Preview {
    InfiniteScrollView()
}
