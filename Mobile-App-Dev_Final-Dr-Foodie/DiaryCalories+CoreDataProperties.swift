//
//  DiaryCalories+CoreDataProperties.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Maria del Carmen Aguilar on 5/2/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//
//

import Foundation
import CoreData


extension DiaryCalories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryCalories> {
        return NSFetchRequest<DiaryCalories>(entityName: "DiaryCalories")
    }

    @NSManaged public var date: Date?
    @NSManaged public var calGoal: Float
    @NSManaged public var calConsumed: Float
    @NSManaged public var percentage: Float
    @NSManaged public var breakfastList: NSSet?
    @NSManaged public var dinnerList: NSSet?
    @NSManaged public var lunchList: NSSet?
    @NSManaged public var snackList: NSSet?

}

// MARK: Generated accessors for breakfastList
extension DiaryCalories {

    @objc(addBreakfastListObject:)
    @NSManaged public func addToBreakfastList(_ value: Breakfast)

    @objc(removeBreakfastListObject:)
    @NSManaged public func removeFromBreakfastList(_ value: Breakfast)

    @objc(addBreakfastList:)
    @NSManaged public func addToBreakfastList(_ values: NSSet)

    @objc(removeBreakfastList:)
    @NSManaged public func removeFromBreakfastList(_ values: NSSet)

}

// MARK: Generated accessors for dinnerList
extension DiaryCalories {

    @objc(addDinnerListObject:)
    @NSManaged public func addToDinnerList(_ value: Dinner)

    @objc(removeDinnerListObject:)
    @NSManaged public func removeFromDinnerList(_ value: Dinner)

    @objc(addDinnerList:)
    @NSManaged public func addToDinnerList(_ values: NSSet)

    @objc(removeDinnerList:)
    @NSManaged public func removeFromDinnerList(_ values: NSSet)

}

// MARK: Generated accessors for lunchList
extension DiaryCalories {

    @objc(addLunchListObject:)
    @NSManaged public func addToLunchList(_ value: Lunch)

    @objc(removeLunchListObject:)
    @NSManaged public func removeFromLunchList(_ value: Lunch)

    @objc(addLunchList:)
    @NSManaged public func addToLunchList(_ values: NSSet)

    @objc(removeLunchList:)
    @NSManaged public func removeFromLunchList(_ values: NSSet)

}

// MARK: Generated accessors for snackList
extension DiaryCalories {

    @objc(addSnackListObject:)
    @NSManaged public func addToSnackList(_ value: Snacks)

    @objc(removeSnackListObject:)
    @NSManaged public func removeFromSnackList(_ value: Snacks)

    @objc(addSnackList:)
    @NSManaged public func addToSnackList(_ values: NSSet)

    @objc(removeSnackList:)
    @NSManaged public func removeFromSnackList(_ values: NSSet)

}
