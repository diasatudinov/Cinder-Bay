//
//  CBQuestView.swift
//  Cinder Bay
//
//

import SwiftUI

struct CBQuestView: View {
    @StateObject var user = ZZUser.shared
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = CBQuestViewModel()
    @State private var index = 0
    var body: some View {
        ZStack {
            
            VStack {
                ZStack {
                    
                    
                    HStack(alignment: .top) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(.backIconCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:60)
                        }
                        
                        Spacer()
                        
                        ZZCoinBg()
                    }.padding(.horizontal)
                }.padding([.top])
                
                Spacer()
                ZStack {
                    Image(.questsBgCB)
                        .resizable()
                        .scaledToFit()
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.quests, id: \.self) { item in
                                ZStack {
                                    VStack {
                                        Image(item.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:175)
                                            .opacity(item.isAchieved ? 1 : 0.5)
                                            
                                        
                                        Image(.hundredCoinsCB)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 40:27)
                                    }.onTapGesture {
                                        if !item.isAchieved {
                                            user.updateUserMoney(for: 100)
                                        }
                                        viewModel.achieveToggle(item)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.background(
            ZStack {
                Image(.appBgCB)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
            }
        )
    }
    
    
}

#Preview {
    CBQuestView()
}
