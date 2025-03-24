//
//  MockFetchAlbumsUseCase.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//
import XCTest
@testable import base_clean_architecture

class MockFetchAlbumsUseCase: FetchAlbumsUseCase {
    var shouldSucceed: Bool = true
    var mockData: [DTOAlbum] = [DTOAlbum(id: 1, userId: 1, title: "Mock Album")]
    var mockError: Error = NSError(domain: "TestError", code: 400, userInfo: nil)
    
    override func execute(arg: Void, config: BaseUseCase<Void, [DTOAlbum]>.UseCaseConfig<[DTOAlbum]>) {
        config.onStart()
        
        if shouldSucceed {
            config.onSuccess(mockData)
        } else {
            config.onError(mockError)
        }
    }
}
