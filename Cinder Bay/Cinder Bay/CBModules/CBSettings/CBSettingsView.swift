//
//  CBSettingsView.swift
//  Cinder Bay
//
//

import SwiftUI

struct CBSettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var settingsVM = CPSettingsViewModel()
    var body: some View {
        ZStack {
            
            VStack {
                
                
                ZStack {
                    
                    Image(.settingsBgCB)
                        .resizable()
                        .scaledToFit()
                    
                    
                    HStack(spacing: 30) {
                        
                        VStack(spacing: 55) {
                            
                            Image(.musicTextCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 80:40)
                            
                            Button {
                                withAnimation {
                                    settingsVM.vibraEnabled.toggle()
                                }
                            } label: {
                                Image(settingsVM.vibraEnabled ? .onCB:.offCB)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 80:40)
                            }
                        }
                        
                        VStack(spacing: 32) {
                            Image(.languageTextCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 80:40)
                            
                            Image(.languageImageCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 80:80)
                            
                        }
                        
                        VStack(spacing: 55) {
                            
                            Image(.soundsTextCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 80:40)
                            
                            Button {
                                withAnimation {
                                    settingsVM.soundEnabled.toggle()
                                }
                            } label: {
                                Image(settingsVM.soundEnabled ? .onCB:.offCB)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 80:40)
                            }
                        }
                        
                    }.padding(.top, 30)
                }.frame(height: ZZDeviceManager.shared.deviceType == .pad ? 88:300)
                
            }.padding(.top, 50)
            
            VStack {
                ZStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            
                        } label: {
                            Image(.backIconCB)
                                .resizable()
                                .scaledToFit()
                                .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:55)
                        }
                        
                        Spacer()
                        
                        ZZCoinBg()
                        
                        Spacer()
                        
                        Image(.backIconCB)
                            .resizable()
                            .scaledToFit()
                            .frame(height: ZZDeviceManager.shared.deviceType == .pad ? 100:55)
                            .opacity(0)
                        
                    }.padding()
                }
                Spacer()
                
            }
        }.frame(maxWidth: .infinity)
            .background(
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
    CBSettingsView()
}
