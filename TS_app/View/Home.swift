//
//  Home.swift
//  TS_app
//
//  Created by Eugene Zvyagin on 17.12.2023.
//

import SwiftUI

struct Home: View {
    
    // Category View Properties
    @State var selectedCategory = "refractor"

    @EnvironmentObject var cartManager: CartManager
    
    
    var body: some View {
        NavigationView {
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
                        Text("Telescope **Collections**")
                            .font(.system(size: 22))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                        
                    }
                    .padding(.horizontal, 120)
                    .padding(.vertical, 10)
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(productList, id: \.id) { item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
        }
    }
    
    
    // Category List View
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
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.15))
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
        .environmentObject(CartManager())
}

// Product Card View
struct ProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding([.trailing, .leading],70)
                .rotationEffect(Angle(degrees: 0))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 140)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 28, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, -10)
                        
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
            .padding(30)
            .frame(width: 342, height: 405)
        }
        .frame(width: 342, height: 420)
        .background(product.color.opacity(0.2))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 10)
    }
}
