//
//  SampleDataMeal.swift
//  Mobile-App-Dev_Final-Dr-Foodie
//
//  Created by Maria del Carmen Aguilar on 5/1/20.
//  Copyright © 2020 Qinyu. All rights reserved.
//

import Foundation

final class SampleDataMeal {
    static func generateBreakfastData() -> [Meal] {
        return [
            Meal(name: "Cheese & Tomato Toast", calories: 227, imagePath: "images/breakfast/0"),
            Meal(name: "GreekYogurt", calories: 315, imagePath: "images/breakfast/1"),
            Meal(name:"Egg Sandwich", calories: 371, imagePath: "images/breakfast/2"),
            Meal(name: "Steel Cut Oatmeal", calories: 115, imagePath: "images/breakfast/3"),
            Meal(name:"Omelette with hash browns", calories: 536, imagePath: "images/breakfast/4"),
            Meal(name: "Scrambled eggs & bacon", calories:588, imagePath: "images/breakfast/5"),
            Meal(name: "Hard boiled egg & fruit", calories:278, imagePath: "images/breakfast/6"),
            Meal(name: "Blueberry pancakes", calories: 352, imagePath: "images/breakfast/7"),
            Meal(name: "Coffe", calories: 2, imagePath: "images/breakfast/8"),
            Meal(name: "Bagel", calories: 289, imagePath: "images/breakfast/9")
        ]
    }
    
    static func generateLunchData() -> [Meal] {
        return[
            Meal(name: "BBQ Ribs", calories: 360, imagePath: "images/lunch/0"),
            Meal(name: "Black Rice", calories: 323, imagePath: "images/lunch/1"),
            Meal(name: "Brown Rice", calories:670, imagePath: "images/lunch/2"),
            Meal(name: "Burrito", calories:326, imagePath: "images/lunch/3"),
            Meal(name: "Chicken Caesar Salad", calories: 392, imagePath: "images/lunch/4"),
            Meal(name: "Chicken Fried Steak", calories: 423, imagePath: "images/lunch/5"),
            Meal(name: "Cobb Salad", calories:632, imagePath: "images/lunch/6"),
            Meal(name: "Dim Sum", calories:37, imagePath: "images/lunch/7"),
            Meal(name: "Fried Rice", calories:662, imagePath: "images/lunch/8"),
            Meal(name: "Fried Shrimp", calories:75, imagePath: "images/lunch/9")
        ]
    }
    
    static func generateDinnerData() -> [Meal]{
        return[
            Meal(name: "Ham & Cheese Sandwich", calories: 352, imagePath: "images/dinner/0"),
            Meal(name: "Mac & Cheese", calories: 699, imagePath: "images/dinner/1"),
            Meal(name: "Pizza(1 slice)", calories: 272, imagePath: "images/dinner/2"),
            Meal(name: "Ramen", calories:380, imagePath: "images/dinner/3"),
            Meal(name: "Coffee", calories: 2, imagePath: "images/dinner/4"),
            Meal(name: "Roast dinner", calories: 240, imagePath: "images/dinner/5"),
            Meal(name: "Taco", calories: 213, imagePath: "images/dinner/6"),
            Meal(name: "Sausage Rolls", calories: 101, imagePath: "images/dinner/7"),
            Meal(name: "Roast beef", calories: 23, imagePath: "images/dinner/8"),
            Meal(name: "Pulled Pork Sandwich", calories:551, imagePath: "images/dinner/9")
        ]
    }
    
    static func generateSnackData() -> [Meal] {
        return[
            Meal(name: "Apple", calories:72, imagePath: "images/snack/0"),
            Meal(name: "Banana", calories: 105, imagePath: "images/snack/1"),
            Meal(name: "Beer", calories:153, imagePath: "images/snack/2"),
            Meal(name: "Bread", calories:66, imagePath: "images/snack/3"),
            Meal(name: "Butter", calories:102, imagePath: "images/snack/4"),
            Meal(name: "Carrots", calories:52, imagePath: "images/snack/5"),
            Meal(name: "Cheddar cheese", calories: 113, imagePath: "images/snack/6"),
            Meal(name: "Granola Bar", calories:193, imagePath: "images/snack/7"),
            Meal(name: "Ice cream", calories:145, imagePath: "images/snack/8"),
            Meal(name: "Orange Juice", calories: 112, imagePath: "images/snack/9")
        ]
    }
}
