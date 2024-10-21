//
//  NetworkManagerTests.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//

import XCTest
@testable import ImageGalleryApp

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!

    override func setUp() {
        super.setUp()
        networkManager = NetworkManager.shared
    }

    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }

    func testFetchImages_Success() {
        // This test will check if the fetchImages method successfully fetches images.
        let expectation = self.expectation(description: "Fetching images should succeed")
        
        networkManager.fetchImages(endpoint: "photos", query: "") { result in
            switch result {
            case .success(let images):
                // Ensure we receive an array of ImageModel
                XCTAssertNotNil(images)
                XCTAssertTrue(images.count > 0) // Check that we got some images
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected success but got error: \(error.localizedDescription)")
            }
        }

        waitForExpectations(timeout: 10, handler: nil)
    }

    func testFetchImages_Failure() {
        // This test will check if the fetchImages method handles failures correctly.
        let expectation = self.expectation(description: "Fetching images should fail with invalid query")

        networkManager.fetchImages(endpoint: "search/photos", query: "invalid_query") { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success.")
            case .failure(let error):
                // Ensure that the error is returned as expected
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 10, handler: nil)
    }
}
