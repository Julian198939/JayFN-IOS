//
//  HomePageView.swift
//  Jay
//
//  Created by Pocky on 2023/8/15.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    AppBar()
                    
                    SearchView()
                    
                    imageSliderView()
                    
                    HStack{
                        Text("Top 1")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            ProductsView()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color("jSecondary"))
                        })
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(productList, id: \.id){product in
                                NavigationLink{
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
               
            }
        }
        .environmentObject(cartManager)
    }
}
   

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                HStack {
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20,height: 20)
                        .padding(.trailing)
                    
                    Text("Taipei,Taiwan")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    NavigationLink(destination: CartView().environmentObject(cartManager)){
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                } //: HSTACK
                Text("Find your favorite \nJay's")
                    .font(.largeTitle.bold())
                + Text(" Album")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("jSecondary"))
            }

        }
        .padding()
        .environmentObject(CartManager())
    }
}
