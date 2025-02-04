//
//  Api.swift
//  BudgetTrackerApi
//
//  Created by admin on 01/02/25.
//

import Foundation
import Combine
let publisher = Just("Hello, Combine")
let subscriber = publisher.sink{ value in print(value)}
