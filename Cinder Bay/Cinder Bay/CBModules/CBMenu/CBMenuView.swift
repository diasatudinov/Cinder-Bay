//
//  CBMenuView.swift
//  Cinder Bay
//
//

import SwiftUI

struct CBMenuView: View {
    @State private var showGame = false
    @State private var showAchievement = false
    @State private var showSettings = false
    @State private var showCalendar = false
    @State private var showDailyReward = false
    @State private var showShop = false

    @StateObject var shopVM = CPShopViewModel()

    var body: some View {
        
        ZStack {
            
            
            VStack(spacing: 0) {
                
                HStack {
                    
                    Spacer()
                    Button {
                        showSettings = true
                    } label: {
                        Image(.settingsIconCB)
                            .resizable()
                            .scaledToFit()
                            .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:85)
                    }
                    
                    
                    
                    
                    
                }.padding(20).padding(.bottom, 5)
                Spacer()
            }
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                    Image(.personImgCB)
                        .resizable()
                        .scaledToFit()
                        .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 140:280)
                    
                    Spacer()
                    
                  
                    
                }
            }.ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack(spacing: 0) {
                    
                    ZZCoinBg()
                    
                    Image(.menuLogoCB)
                        .resizable()
                        .scaledToFit()
                        .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 140:112)
                    VStack(spacing: 10) {
                        
                        Button {
                            showGame = true
                        } label: {
                            Image(.playIconCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:65)
                        }
                        
                        HStack {
                            Button {
                                showShop = true
                            } label: {
                                Image(.shopIconCB)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:50)
                            }
                            
                            Button {
                                showAchievement = true
                            } label: {
                                Image(.achievementsIconCB)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:50)
                            }
                            
                            Button {
                                showDailyReward = true
                            } label: {
                                Image(.dailyIconCB)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:50)
                            }
                        }
                    }
                }
            }
            
            
        }.frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(.appBgCB)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                }
            )
            .fullScreenCover(isPresented: $showGame) {
//                CBGameView()
            }
            .fullScreenCover(isPresented: $showAchievement) {
                CBAchievementsView()
            }
            .fullScreenCover(isPresented: $showSettings) {
                CBSettingsView()
            }
            .fullScreenCover(isPresented: $showDailyReward) {
                CBQuestView()
            }
            .fullScreenCover(isPresented: $showShop) {
                CBShopView(viewModel: shopVM)
            }
        
    }
}

#Preview {
    CBMenuView()
}
