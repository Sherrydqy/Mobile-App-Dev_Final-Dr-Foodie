//
//  Diary.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Maria del Carmen Aguilar on 5/3/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import Foundation

struct Diary{
    var date: Date
    var calGoal: Int?
    var calConsumed: Int?
    var percentage: Float?
    var breakfastList: [Meal] = []
    var lunchList: [Meal] = []
    var dinnerList: [Meal] = []
    var snackList: [Meal] = []
}
