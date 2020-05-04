//
//  Snacks+CoreDataProperties.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Maria del Carmen Aguilar on 5/2/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//
//

import Foundation
import CoreData


extension Snacks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Snacks> {
        return NSFetchRequest<Snacks>(entityName: "Snacks")
    }

    @NSManaged public var name: String?
    @NSManaged public var calories: Int16
    @NSManaged public var toDiaryEntry: DiaryCalories?

}
