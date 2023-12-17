//
//  CollectionView.swift
//  TS_app
//
//  Created by Eugene Zvyagin on 17.12.2023.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
        ScrollView {
            VStack {
                HStack {
                    Text("Place an order for a **Telescope** for yourself. Get closer to the stars.")
                        .font(.system(size: 20))
                        .padding(.trailing)
                    
                    Spacer()
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 50, height: 60)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .foregroundColor(.black)
                }
                .padding(20)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                    ForEach(productList, id: \.id) { item in
                        SmallProductCard(product: item)
                            .environmentObject(cartManager)
                    }
                })
                .padding(.horizontal)
            }
        }
    }
    .navigationBarHidden(true)
}
}

#Preview {
CollectionView()
    .environmentObject(CartManager())
}

// Small Product Card
struct SmallProductCard: View {

var product: Product

@EnvironmentObject var cartManager: CartManager

var body: some View {
    ZStack {
        Image(product.image)
            .resizable()
            .scaledToFit()
            .padding(.trailing, -200)
            .rotationEffect(Angle(degrees: 30))
        
        ZStack {
            VStack(alignment: .leading, content: {
                Text("\(product.name)")
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: 70)
                
                Text(product.category)
                    .font(.system(size: 12))
                    .padding()
                    .background(.white.opacity(0.5))
                    .clipShape(Capsule())
                
                Spacer()
                
                HStack {
                    Text("$\(product.price).0")
                        .font(.system(size: 13, weight: .semibold))
                    
                    Spacer()
                    
                    Button {
                        cartManager.addToCart(product: product)
                    } label: {
                        Image(systemName: "basket")
                            .imageScale(.large)
                            .frame(width: 45, height: 40)
                            .background(.black)
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    
                }
                .padding(.trailing, -12)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(.white.opacity(0.9))
                .clipShape(Capsule())
            })
        }
        .padding(20)
        .frame(width: 170, height: 215)
    }
    .frame(width: 170, height: 210)
    .background(product.color.opacity(0.13))
    .clipShape(.rect(cornerRadius: 30))
    .padding(.leading, 10)
}
}

