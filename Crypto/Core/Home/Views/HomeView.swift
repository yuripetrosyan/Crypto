//
//  HomeView.swift
//  Crypto
//
//  Created by Yuri Petrosyan on 26/11/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack{
                
                homeHeader
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                    
                }
                if showPortfolio{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
                
                
            }
        }
        
        
    }
}


struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}




extension HomeView {
    
    //homeHeader
    private var homeHeader: some View {
        HStack{
                CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(nil, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                        .frame(width: 90, height: 90)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(nil, value: showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                    
                }

        }.padding(.horizontal)
    }
    private var allCoinsList: some View {
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View {
        List{
            ForEach(vm.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }.font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .padding(.horizontal)
    }
}
