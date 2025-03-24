//
//  FetchAlbumsUseCaseTests.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

import XCTest
@testable import base_clean_architecture
import Factory

class FetchAlbumsUseCaseTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        
        Container.shared.albumRepository.register {
            MockAlbumRepository()
        }
    }
    
    func testFetchAlbumsSuccess() {
        let useCase = FetchAlbumsUseCase(repository: Container.shared.albumRepository())
        
        let expectation = XCTestExpectation(description: "Fetch albums successfully")
        
        useCase.execute(arg: (), config: BaseUseCase.UseCaseConfig(onStart: {
            XCTAssertTrue(true)
        }, onSuccess: { data in
            XCTAssertEqual(data.count, 2)
            XCTAssertEqual(data.first?.title, "Testing album")
            expectation.fulfill()
        }, onError: { _ in
            XCTFail("Expected success but got an error")
        }))
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchAlbumsFail() {
        Container.shared.albumRepository.register {
            MockErrorAlbumRepository()
        }
        
        let useCase = FetchAlbumsUseCase(repository: Container.shared.albumRepository())
        
        let expectation = XCTestExpectation(description: "Fetch albums fail")
        
        useCase.execute(arg: (), config: BaseUseCase.UseCaseConfig(onStart: {
            XCTAssertTrue(true)
        }, onSuccess: { data in
            XCTFail("Expected failure but got success")
        }, onError: { error in
            XCTAssertTrue(error is AppError)
            expectation.fulfill()
        }))
        
        wait(for: [expectation], timeout: 1.0)
    }
}
