//
//  DebugFunctions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 04.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

// MARK:- Performance

public func startTimePerformanceTest() -> NSDate {
    return NSDate()
}

public func stopTimePerformanceTest(startDate: NSDate) {
    let endDate = NSDate()
    let time = endDate.timeIntervalSinceDate(startDate)
    print("Time is \(time)")
}