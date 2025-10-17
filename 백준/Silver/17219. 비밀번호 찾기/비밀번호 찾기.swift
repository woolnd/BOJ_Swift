//
//  main.swift
//  BOJ
//
//  Created by wodnd on 9/16/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let N = input[0], M = input[1]

var sitePassword: [String : String] = [:]

for _ in 0..<N {
    let inputSitePassword = readLine()!.split(separator: " ").map{ String($0) }
    let site = inputSitePassword[0], password = inputSitePassword[1]
    sitePassword[site] = password
}


for _ in 0..<M {
    let checkSite = readLine()!
    print(sitePassword[checkSite]!)
}