//
//  StepsTests.swift
//  StepsTests
//
//  Created by Daniel Lyons on 10/5/23.
//


import XCTest
import Dependencies
import DependenciesAdditions
@testable import Steps

final class StepsTests: XCTestCase {
//    func testUserDefaultsToggle() async {
//        withDependencies {
//            $0.userDefaults = .ephemeral()
//            $0.userDefaults.set(true, forKey: Constants.notificationKey)
//        } operation: {
//            @Dependency(\.userDefaults) var userDefaults
//            XCTAssertEqual(true, userDefaults.bool(forKey: Constants.notificationKey))
//        }
//    }
    
    func testStepCheckpointsReached() {
        var vm = StepsViewModel()
        vm.steps = .mock
        vm.goal = 10_000
        
        XCTAssertEqual(6_789, vm.currentSteps)
        XCTAssertEqual(true, vm.checkPointOneReached) // 25%
        XCTAssertEqual(true, vm.checkPointTwoReached) // 50%
        XCTAssertEqual(false, vm.checkPointThreeReached) // 75%
        XCTAssertEqual(false, vm.checkPointFourReached) // 100%
    }
    
    func testSoccerFieldsWalkedString() {
        var vm = StepsViewModel()
        
        // For every 144 Steps you've walked about 1 soccer field.
        vm.steps = [Step(count: 0, date: .now)]
        XCTAssertEqual(vm.soccerFieldsWalkedString, Constants.walkedFullSoccerFieldToday)
        vm.steps = [Step(count: 145, date: .now)]
        XCTAssertEqual(vm.soccerFieldsWalkedString, Constants.walkedOneSoccerFieldToday)
        vm.steps = [Step(count:289, date: .now)]
        XCTAssertEqual(vm.soccerFieldsWalkedString, String(format: Constants.walkedCustomSoccerFieldToday, 2))
    }
    
    func testUserDefaults() async {
        withDependencies {
            $0.userDefaults = .ephemeral()
        } operation: {
            var vm = StepsViewModel()
            vm.goal = 1_234
            @Dependency(\.userDefaults) var userDefaults
            XCTAssertEqual(1_234, userDefaults.integer(forKey: Constants.goalKey))
            
            vm.stepCount = 2_345
            XCTAssertEqual(2_345, userDefaults.integer(forKey: Constants.goalKey))
        }
        
    }

}
