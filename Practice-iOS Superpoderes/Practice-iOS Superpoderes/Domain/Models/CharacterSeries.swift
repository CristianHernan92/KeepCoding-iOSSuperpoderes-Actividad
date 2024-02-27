import Foundation

// MARK: - CharacterSeries
struct CharacterSeries: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharacterSeriesData
}

// MARK: - CharacterSeriesData
struct CharacterSeriesData: Codable {
    let offset, limit, total, count: Int
    let results: [CharacterSeriesDataResult]
}

// MARK: - CharacterSeriesDataResult
struct CharacterSeriesDataResult: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let resourceURI: String
    let urls: [CharacterSeriesDataResultURLElement]
    let startYear, endYear: Int
    let rating, type: String
    let modified: String
    let thumbnail: CharacterSeriesDataResultThumbnail
    let creators: CharacterSeriesDataResultCreators
    let characters: CharacterSeries_Characters
    let stories: CharacterSeriesDataResultStories
    let comics, events: CharacterSeries_Characters
    let next, previous: CharacterSeries_Characters_Next?
}

// MARK: - CharacterSeries_Characters
struct CharacterSeries_Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharacterSeries_Characters_Next]
    let returned: Int
}

// MARK: - CharacterSeries_Characters_Next
struct CharacterSeries_Characters_Next: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - CharacterSeriesDataResultCreators
struct CharacterSeriesDataResultCreators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharacterSeriesDataResultCreatorsItem]
    let returned: Int
}

// MARK: - CharacterSeriesDataResultCreatorsItem
struct CharacterSeriesDataResultCreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}

// MARK: - CharacterSeriesDataResultStories
struct CharacterSeriesDataResultStories: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharacterSeriesDataResultStoriesItem]
    let returned: Int
}

// MARK: - CharacterSeriesDataResultStoriesItem
struct CharacterSeriesDataResultStoriesItem: Codable {
    let resourceURI: String
    let name: String
    //let type: CharacterSeriesDataResultStoriesItemType
    let type: String
}

// MARK: - CharacterSeriesDataResultThumbnail
struct CharacterSeriesDataResultThumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - CharacterSeriesDataResultURLElement
struct CharacterSeriesDataResultURLElement: Codable {
    let type: String
    let url: String
}
