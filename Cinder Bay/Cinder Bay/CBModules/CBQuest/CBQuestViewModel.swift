//
//  ZZAchievementsViewModel.swift
//  Cinder Bay
//
//  Created by Dias Atudinov on 31.10.2025.
//


import SwiftUI

class CBQuestViewModel: ObservableObject {
    
    @Published var quests: [NEGAchievement] = [
        NEGAchievement(image: "quest1ImageCB", title: "quest1TextCB", isAchieved: false),
        NEGAchievement(image: "quest2ImageCB", title: "quest2TextCB", isAchieved: false),
        NEGAchievement(image: "quest3ImageCB", title: "quest3TextCB", isAchieved: false),
        NEGAchievement(image: "quest4ImageCB", title: "quest4TextCB", isAchieved: false),
        NEGAchievement(image: "quest5ImageCB", title: "quest5TextCB", isAchieved: false),
    ] {
        didSet {
            saveQuestsItem()
        }
    }
        
    init() {
        loadQuestsItem()
    }
    
    private let userDefaultsAchievementsKey = "achievementsKeyCB"
    
    func achieveToggle(_ achive: NEGAchievement) {
        guard let index = quests.firstIndex(where: { $0.id == achive.id })
        else {
            return
        }
        quests[index].isAchieved.toggle()
        
    }
   
    
    
    func saveQuestsItem() {
        if let encodedData = try? JSONEncoder().encode(quests) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsAchievementsKey)
        }
        
    }
    
    func loadQuestsItem() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsAchievementsKey),
           let loadedItem = try? JSONDecoder().decode([NEGAchievement].self, from: savedData) {
            quests = loadedItem
        } else {
            print("No saved data found")
        }
    }
}
