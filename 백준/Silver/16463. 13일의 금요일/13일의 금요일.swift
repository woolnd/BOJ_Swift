//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = Int(readLine() ?? "") ?? 0
var count = 0
var dayOfWeek = 1 //(0 = 월 ... 6 = 일)

let daysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]

func chkLeapYear(_ year: Int) -> Bool{
    if year % 400 == 0 { return true }
    else if year % 400 != 0 && year % 100 == 0 { return false }
    else if year % 100 != 0 && year % 4 == 0 { return true }
    else { return false }
}

for year in 2019...input{
    for month in 0..<12 {
        let days = (month == 1 && chkLeapYear(year)) ? 29 : daysInMonth[month]
        
        let day13 = (dayOfWeek + 12) % 7
        
        if day13 == 4{
            count += 1
        }
        
        dayOfWeek = (days + dayOfWeek) % 7
    }
}

print(count)