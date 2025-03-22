//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let inputYear = Int(readLine() ?? "") ?? 0

var arrayYear: [Int] = []

for i in 2019...inputYear{
    arrayYear.append(i)
}

var chkLeapYear: [Bool] = []

for i in 0..<arrayYear.count {
    if arrayYear[i] % 400 == 0 {
        chkLeapYear.append(true)
    } else if arrayYear[i] % 400 != 0 && arrayYear[i] % 100 == 0{
        chkLeapYear.append(false)
    } else if arrayYear[i] % 100 != 0 && arrayYear[i] % 4 == 0{
        chkLeapYear.append(true)
    } else {
        chkLeapYear.append(false)
    }
}

var startDate: [String] = Array(repeating: "", count: arrayYear.count)
startDate[0] = "화"

var week = ["월", "화", "수", "목", "금", "토", "일"]
var date = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


for i in 0..<arrayYear.count - 1 {
    for j in 0..<week.count {
        if startDate[i] == week[j]{
            if chkLeapYear[i] {
                if j == 5{
                    startDate[i+1] = week[0]
                } else if j == 6{
                    startDate[i+1] = week[1]
                } else {
                    startDate[i+1] = week[j + 2]
                }
            } else {
                if j == 6{
                    startDate[i+1] = week[0]
                } else {
                    startDate[i+1] = week[j+1]
                }
            }
        }
    }
}

var count = 0

for i in 0..<arrayYear.count {
    var monthStartDate: [String] = Array(repeating: "", count: 12)
    monthStartDate[0] = startDate[i]
    
    if chkLeapYear[i] {
        date[1] = 29
    } else {
        date[1] = 28
    }
    
    for i in 0..<11 {
        for j in 0..<week.count {
            if monthStartDate[i] == week[j]{
                if date[i] == 31 {
                    if j == 4{
                        monthStartDate[i + 1] = week[0]
                    } else if j == 5{
                        monthStartDate[i + 1] = week[1]
                    } else if j == 6 {
                        monthStartDate[i + 1] = week[2]
                    } else {
                        monthStartDate[i + 1] = week[j + 3]
                    }
                } else if date[i] == 30 {
                    if j == 5{
                        monthStartDate[i + 1] = week[0]
                    } else if j == 6 {
                        monthStartDate[i + 1] = week[1]
                    } else {
                        monthStartDate[i + 1] = week[j + 2]
                    }
                } else if date[i] == 29 {
                    if j == 6 {
                        monthStartDate[i + 1] = week[0]
                    } else {
                        monthStartDate[i + 1] = week[j + 1]
                    }
                } else {
                    monthStartDate[i + 1] = week[j]
                }
            }
        }
    }
    
    for day in monthStartDate {
        if day == "일" {
            count += 1
        }
    }

}

print(count)
