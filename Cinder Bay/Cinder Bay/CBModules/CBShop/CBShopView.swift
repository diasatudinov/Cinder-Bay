//
//  CBShopView.swift
//  Cinder Bay
//
//

import SwiftUI

struct CBShopView: View {
    @StateObject var user = ZZUser.shared
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CPShopViewModel
    @State var category: JGItemCategory = .skin
    var body: some View {
        ZStack {
            
            ZStack {
                
                Image(.shopBgCB)
                    .resizable()
                    .scaledToFit()
                
                
                VStack {
                    
                    HStack {
                        
                        ForEach(category == .skin ? viewModel.shopSkinItems :viewModel.shopBgItems, id: \.self) { item in
                            achievementItem(item: item, category: category == .skin ? .skin : .background)
                            
                        }
                        
                        
                    }
                    
                }
                
                VStack {
                    Spacer()
                    HStack(spacing: 30) {
                        Button {
                            category = .skin
                        } label: {
                            Image(category == .skin ? .skinsTextCB: .skinsOffTextCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                        
                        Button {
                            category = .background
                        } label: {
                            Image(category == .background ? .bgTextCB:.bgOffTextCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:50)
                        }
                    }
                }
                
            }.frame(height: 270)
            
            
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        
                        
                    } label: {
                        Image(.backIconCB)
                            .resizable()
                            .scaledToFit()
                            .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:50)
                    }
                    
                    Spacer()
                    
                    ZZCoinBg()
                    
                    
                    
                }.padding()
                Spacer()
                
                
                
            }
        }.frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(.appBgCB)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                }
            )
    }
    
    @ViewBuilder func achievementItem(item: JGItem, category: JGItemCategory) -> some View {
        ZStack {
            
            Image(item.icon)
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                Button {
                    viewModel.selectOrBuy(item, user: user, category: category)
                } label: {
                    
                    if viewModel.isPurchased(item, category: category) {
                        ZStack {
                            Image(viewModel.isCurrentItem(item: item, category: category) ? .usedBtnBgCB : .useBtnBgCB)
                                .resizable()
                                .scaledToFit()
                            
                        }.frame(height: ZZDeviceManager.shared.deviceType == .pad ? 50:42)
                        
                    } else {
                        Image(viewModel.isMoneyEnough(item: item, user: user, category: category) ? .hundredCoinsCB : .hundredOffCoinCB)
                            .resizable()
                            .scaledToFit()
                            .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 50:42)
                    }
                    
                    
                }
            }.offset(y: 8)
            
        }.frame(height: ZZDeviceManager.shared.deviceType == .pad ? 300:145)
        
    }
}

#Preview {
    CBShopView(viewModel: CPShopViewModel())
}
