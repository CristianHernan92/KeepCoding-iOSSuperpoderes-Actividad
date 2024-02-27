import Foundation

// MARK: - Characters
struct Characters: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharactersData
}

// MARK: - CharactersData
struct CharactersData: Codable {
    let offset, limit, total, count: Int
    let results: [CharactersDataResult]
}

// MARK: - CharactersDataResult
struct CharactersDataResult: Codable,Identifiable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: CharactersDataResultThumbnail
    let resourceURI: String
    let comics: CharactersDataResultComics
    let series: CharactersDataResultSeries
    let stories: CharactersDataResultStories
    let events: CharactersDataResultComics
    let urls: [CharactersDataResultURLElement]
}

// MARK: - CharactersDataResultComics
struct CharactersDataResultComics: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersDataResultComicsItem]
    let returned: Int
}

// MARK: - CharactersDataResultComicsItem
struct CharactersDataResultComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - CharactersDataResultSeries
struct CharactersDataResultSeries: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersDataResultSeriesItem]
    let returned: Int
}

// MARK: - CharactersDataResultSeriesItem
struct CharactersDataResultSeriesItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - CharactersDataResultStories
struct CharactersDataResultStories: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersDataResultStoriesItem]
    let returned: Int
}

// MARK: - CharactersDataResultStoriesItem
struct CharactersDataResultStoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

// MARK: - CharactersDataResultThumbnail
struct CharactersDataResultThumbnail: Codable {
    let path: String
    let thumbnailExtension: CharactersDataResultThumbnailExtension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum CharactersDataResultThumbnailExtension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - CharactersDataResultURLElement
struct CharactersDataResultURLElement: Codable {
    let type: CharactersDataResultURLElementType
    let url: String
}

enum CharactersDataResultURLElementType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
