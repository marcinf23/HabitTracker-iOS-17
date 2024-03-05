//
//  Activities.swift
//  HabitTracker
//
//  Created by Marcin Frydrych on 05/03/2024.
//

import Foundation

@Observable
class Activities {
    
    var activities: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.setValue(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: "Activities"),
            let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
                activities = decoded
                return
            
        }
        
        activities = []
    }
}
