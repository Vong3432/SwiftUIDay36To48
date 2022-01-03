//
//  ActivitiesManager.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 03/01/2022.
//

import Foundation

class ActivitiesManager: ObservableObject {
    @Published var activities: [Activity] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            } else {
                fatalError("Cannot encode \(activities)")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decoded
            } else {
                fatalError("Cannot decode \(savedActivities)")
            }
        } 
    }
    
    func saveActivity(name: String, description: String) {
        let activity = Activity(name: name, description: description)
        activities.append(activity)
    }
    
    func addCompleteCount(of activity: Activity) {
        guard let index = activities.firstIndex(of: activity) else { return }
        
        var copyActivity = activities[index]
        copyActivity.completedCount += 1
        
        activities[index] = copyActivity
    }
}
