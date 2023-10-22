import XCTest
import Dependencies
import DependenciesAdditions
@testable import Steps

@MainActor
final class StepsTests: XCTestCase {
    
    func testStepCheckpointsReached() {
        let vm = StepsViewModel()
        vm.steps = .mock
        vm.goal = 10_000
        
        XCTAssertEqual(6_789, vm.currentSteps)
        XCTAssertEqual(true, vm.checkPointOneReached) // 25%
        XCTAssertEqual(true, vm.checkPointTwoReached) // 50%
        XCTAssertEqual(false, vm.checkPointThreeReached) // 75%
        XCTAssertEqual(false, vm.checkPointFourReached) // 100%
    }
    
    func testSoccerFieldsWalkedString() {
        let vm = StepsViewModel()
        
        // For every 144 Steps you've walked about 1 soccer field.
        vm.steps = [Step(count: 0, date: .now)]
        XCTAssertEqual(vm.soccerFieldsWalkedString, Constants.walkedFullSoccerFieldToday)
        vm.steps = [Step(count: 145, date: .now)]
        XCTAssertEqual(vm.soccerFieldsWalkedString, Constants.walkedOneSoccerFieldToday)
        vm.steps = [Step(count:289, date: .now)]
        XCTAssertEqual(vm.soccerFieldsWalkedString, String(format: Constants.walkedCustomSoccerFieldToday, 2))
    }
    
    // TODO: Test @AppStorage 
    func testUserDefaults() async {
        let newGoal = 1_234
        
        let vm = StepsViewModel()
        vm.goal = newGoal
        
        let resultGoal = UserDefaults.appGroup?.value(forKey: Constants.goalKey) as? Int
        XCTAssertEqual(newGoal, resultGoal)
            
        
// Not sure yet how to inject UserDefaults dependency into @AppStorage.
// Even though both @Dependency(\.userDefaults) and @AppStorage write to UserDefaults, @AppStorage is unaware of @Dependency
//        vm.stepCount = 2_345
//        XCTAssertEqual(2_345, userDefaults.integer(forKey: Constants.stepCountKey))
        
    }

}
