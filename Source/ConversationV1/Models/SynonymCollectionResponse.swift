/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import RestKit

/** SynonymCollectionResponse. */
public struct SynonymCollectionResponse: JSONDecodable, JSONEncodable {

    /// An array of synonyms.
    public let synonyms: [SynonymResponse]

    public let pagination: PaginationResponse

    /**
     Initialize a `SynonymCollectionResponse` with member variables.

     - parameter synonyms: An array of synonyms.
     - parameter pagination: 

     - returns: An initialized `SynonymCollectionResponse`.
    */
    public init(synonyms: [SynonymResponse], pagination: PaginationResponse) {
        self.synonyms = synonyms
        self.pagination = pagination
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `SynonymCollectionResponse` model from JSON.
    public init(json: JSON) throws {
        synonyms = try json.decodedArray(at: "synonyms", type: SynonymResponse.self)
        pagination = try json.decode(at: "pagination", type: PaginationResponse.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `SynonymCollectionResponse` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["synonyms"] = synonyms.map { $0.toJSONObject() }
        json["pagination"] = pagination.toJSONObject()
        return json
    }
}
