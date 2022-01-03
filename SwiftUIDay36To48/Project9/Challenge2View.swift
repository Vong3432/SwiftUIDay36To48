//
//  Challenge2View.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 03/01/2022.
//

import SwiftUI

struct Challenge2View: View {
    
    @StateObject private var activityManager =  ActivitiesManager()
    @State private var showAddingForm = false
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(activityManager.activities) { activity in
                    NavigationLink {
                        ActivityDetailView(activity: activity, activityManager: activityManager)
                    } label: {
                        Text(activity.name)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    addButton
                }
            }
            .navigationTitle("Habit Tracker")
            .sheet(isPresented: $showAddingForm) {
                AddingFormView(activityManager: activityManager)
            }
        }
    }
    
    private var addButton: some View {
        Button {
            showAddingForm = true
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct Challenge2View_Previews: PreviewProvider {
    static var previews: some View {
        Challenge2View()
    }
}

struct AddingFormView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activityManager: ActivitiesManager
    @State private var name: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Enter name", text: $name)
                }
                
                Section("Description") {
                    TextField("Enter description", text: $description)
                }
            }
            .toolbar {
                ToolbarItem {
                    saveButton
                }
            }
            .navigationTitle("New activity")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var saveButton: some View {
        Button("Save") {
            activityManager.saveActivity(name: name, description: description)
            dismiss()
        }
    }
}

struct ActivityDetailView: View {
    let activity: Activity
    @ObservedObject var activityManager: ActivitiesManager
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack {
                        VStack {
                            Text(activity.name)
                                .font(.title)
                            
                            Text(activity.description)
                                .font(.body)
                        }
                        
                        Spacer()
                        
                        Text("completed: \(activity.completedCount)")
                    }
                    
                    Spacer()
                    
                    Button("Complete") {
                        activityManager.addCompleteCount(of: activity)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(18)
                }
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                
            }
        }
    }
    
}
