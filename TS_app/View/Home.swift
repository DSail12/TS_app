//
//  Home.swift
//  TS_app
//
//  Created by Eugene Zvyagin on 17.12.2023.
//

import SwiftUI

struct Home: View {
    
    // Vategory View Properties
    @State var selectedCategory = ""
    var body: some View {
        ScrollView {
            VStack {
                // Header
                HStack {
                    Text("Place an order for a **Telescope** for yourself. Get closer to the stars.")
                        .font(.system(size: 20))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 50, height: 60)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))

                }
                .padding(20)
                
                // Category List
                CategoryListView
                
                // Collection View
                HStack {
                    Text("Refractor **Collections**")
                        .font(.system(size:11))
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .imageScale(.large)
                }
                .padding(.horizontal, 120)
                .padding(.vertical, 10)
                
                // Product List
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(productList, id: \.id) { item in
                            ProductCard(product: item)
                        }
                    }
                }
            }
        }
    }
    
    //Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(item.icon)
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                }
                                Text(item.title)
                            }
                            .padding(10)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }

        }
    }
}
    

#Preview {
    Home()
}

// Product Card View
struct ProductCard: View {
    
    var product: Product
    
    var body: some View {
        ZStack {
            
        }
        .padding()
        .frame(width:342, height: 425)
        .background(product.color.opacity(0.2))
        .padding(.horizontal)
    }
}
