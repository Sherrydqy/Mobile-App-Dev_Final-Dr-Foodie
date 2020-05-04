//
//  SampleDataDiaryCalories.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Maria del Carmen Aguilar on 5/3/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import Foundation

final class SampleDataDiaryCalories{
    static func generateDiaryCalories() -> [Diary]{
        return [
            Diary(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, calGoal: 1600, calConsumed: 2070, breakfastList:[Meal(name: "Greek Yogurt", calories: 315), Meal(name: "Egg Sandwich", calories: 371)], lunchList: [Meal(name: "Fried Rice", calories: 662)], dinnerList: [Meal(name: "Ham & Cheese Sandwich", calories: 352)], snackList: [Meal(name: "Apple", calories: 72), Meal(name: "Banana", calories: 105), Meal(name: "Granola Bar", calories: 193)])
        ]
    }
}
