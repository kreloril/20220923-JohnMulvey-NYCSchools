//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by John Mulvey on 9/23/22.
//

import XCTest
@testable import NYCSchools

class NYCSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testimportDataSourcesLocal() throws {
        
        let resultSchools =  SchoolDataSource.importSchoolDataSource(name: "f9bf-2cp4-schools")
        
        if let resultSchools = resultSchools {
            XCTAssertFalse(resultSchools.count == 0)
            
            let models = SchoolInterface.valueObjectsFromModel(objects: resultSchools)
            
            XCTAssertFalse(models.count == 0)
            
        }
        

        let resultScores = SatScoreDataSource.importSatScoreDataSource(name: "f9bf-2cp4-sat")
        
        if let resultScores = resultScores {
            XCTAssertFalse(resultScores.count == 0)
            let models = SatScoreInterface.valueObjectsFromModel(objects: resultScores)
            XCTAssertFalse(models.count == 0)
        }
        
    }
    
    func testpresenterSchool() throws {
        let presenter = SchoolPresenter(dataSourceSchools: "f9bf-2cp4-schools", dataSourceScores: "f9bf-2cp4-sat")
        
        if let vmSchools = presenter.viewModelSchools {
            XCTAssertFalse(vmSchools.count == 0)
        }
        
        if let vmScores = presenter.viewModelScores {
            XCTAssertFalse(vmScores.count == 0)
        }
        
        
    }

}
