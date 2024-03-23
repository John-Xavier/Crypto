//
//  HomeStatsView.swift
//  Crypto
//
//  Created by John Xavier  on 21/02/2024.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @Binding var showPortfolio : Bool
    
    var body: some View {
        HStack{
            ForEach(vm.statistics){ stat in
                StatistcisView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width/3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
        
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.homeVm)
}
