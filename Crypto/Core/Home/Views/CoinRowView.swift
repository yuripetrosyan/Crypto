//
//  CoinRowView.swift
//  Crypto
//
//  Created by Yuri Petrosyan on 29/11/2024.
//

import SwiftUI


struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
                
    var body: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            
            if showHoldingsColumn{
                VStack(alignment: .trailing){
                    Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                        .bold()
                    Text((coin.currentHoldings ?? 0).asNumberString())
                }
                .foregroundStyle(Color.theme.accent)
            }
            VStack(alignment: .trailing){
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundStyle(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "-")
                    .foregroundStyle(
                        (coin.priceChange24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
                
            }.frame(width: UIScreen.main.bounds.width / 3.5)
        }
        
    }
}

struct CoinRowView_Preview: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
    }
}
