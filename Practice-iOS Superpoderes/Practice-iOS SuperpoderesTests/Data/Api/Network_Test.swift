import XCTest
@testable import Practice_iOS_Superpoderes

final class Network_Test: XCTestCase {
    
        var sut:Network!
        var heroId = 1011334
        
        //MARK: -SE EJECUTA ANTES DE CADA TEST (REINICIALIZACIÓN)-
        override func setUp() {
            super.setUp()
        }
        
        //MARK: -SE EJECUTA DESPUÉS DE CADA TEST (LIMPIEZA)-
        override func tearDown() {
            super.tearDown()
            sut = nil
        }
        
        //MARK: -TESTS-
        func test_inisialization(){
            sut = Network()
            XCTAssertNotNil(sut)
        }
    
        func test_getHeros() async{
            sut = Network()
            var characterDataResult:[CharactersDataResult] = []
            characterDataResult = await sut.getHeros()
            XCTAssert(characterDataResult.count != 0)
        }
    
        func test_getHeroSeries() async{
            sut = Network()
            var characterSeriesDataResult:[CharacterSeriesDataResult] = []
            characterSeriesDataResult = await sut.getHeroSeries(characterId: heroId)
            XCTAssert(characterSeriesDataResult.count != 0)
        }
}
