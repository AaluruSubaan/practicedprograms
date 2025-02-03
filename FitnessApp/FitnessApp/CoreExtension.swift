//
//  CoreExtension.swift
//  FitnessApp
//
//  Created by admin on 03/02/25.
//

import Foundation


extension Workout{
    var exercisesArray: [Exercise]{
    
        let exercisesSet = self.exercises as? Set<Exercise>
        let exercisesArray1 = exercisesSet?.sorted { $0.name ?? ""<$1.name ?? ""} ?? []
        return exercisesArray1
    }
}
