//
//  Model.swift
//  CheckRSHours
//
//  Created by ilabrosimov on 09.01.2022.
//

import Foundation
class Lessons: ObservableObject {
    
    @Published var items = [Lesson] ()
    
    func add (item: Lesson) {
        items.append(item)
    }
    func remove ( at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    var total: Int {
        var counter = 0
        for item in items {
            counter += item.price
        }
        return counter
    }
}
struct Lesson: Identifiable, Comparable {
    static func < (lhs: Lesson, rhs: Lesson) -> Bool {
        lhs.date > rhs.date
    }
    
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        lhs.date == rhs.date
    }
    
    let id = UUID()
    let date: Date
    let hours: Int
    var pro = false
    var group = 1
    var special = false
    let rate = Rates()
    var price: Int {      
        return hours * (rate.baseRate + (pro ? 1 : 0) * rate.pro  + (special ? 1 : 0 ) * rate.special + rate.group[group])
    }
    
}

struct Rates {
    var baseRate = 1000
    var pro = 200
    var special = 200
    var group = [0,0,100,200,200,350,350,500,500,500]
}
