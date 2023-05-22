//
//  RandomUser.swift
//  ContactListAPI
//
//  Created by MikhaiL on 22.05.2023.
//

// MARK: - Result
struct User {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
    
    init(value: [String: Any]) {
        gender = value["gender"] as? String ?? ""
        
        let nameDict = value["name"] as? [String: String] ?? [:]
        name = Name(value: nameDict)
        
        let locationDict = value["location"] as? [String: Any] ?? [:]
        location = Location(value: locationDict)
        
        email = value["email"] as? String ?? ""
        
        let loginDict = value["login"] as? [String: String] ?? [:]
        login = Login(value: loginDict)
        
        let dobDict = value["dob"] as? [String: String] ?? [:]
        dob = Dob(value: dobDict)
        
        let registeredDict = value["registered"] as? [String: Any] ?? [:]
        registered = Dob(value: registeredDict)
        
        phone = value["phone"] as? String ?? ""
        cell = value["cell"] as? String ?? ""
        
        let idDict = value["id"] as? [String: String] ?? [:]
        id = ID(value: idDict)
        
        let pictureDict = value["picture"] as? [String: String] ?? [:]
        picture = Picture(value: pictureDict)
        
        nat = value["nat"] as? String ?? ""
    }
    
    static func getRandomUsers(from value: Any) -> [User] {
        guard let value = value as? [String: Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.map { User(value: $0) }
    }
}

// MARK: - Name
struct Name {
    let title, first, last: String
    
    init(value: [String: String]) {
        title = value["title"] ?? ""
        first = value["first"] ?? ""
        last = value["last"] ?? ""
    }
    
    init(first: String, last: String) {
        self.first = first
        self.last = last
        title = ""
    }
}

// MARK: - Location
struct Location {
    let street: Street
    let city, state, country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
    
    init(value: [String: Any]) {
        let streetDict = value["street"] as? [String: Any] ?? [:]
        street = Street(value: streetDict)
        city = value["city"] as? String ?? ""
        state = value["state"] as? String ?? ""
        country = value["country"] as? String ?? ""
        postcode = value["postcode"] as? Int ?? 0
        
        let coordinateDict = value["coordinate"] as? [String: String] ?? [:]
        coordinates = Coordinates(value: coordinateDict)
        
        let timezoneDict = value["timezone"] as? [String: String] ?? [:]
        timezone = Timezone(value: timezoneDict)
    }
}

// MARK: - Timezone
struct Timezone {
    let offset, timezoneDescription: String
    
    init(value: [String: String]) {
        offset = value["offset"] ?? ""
        timezoneDescription = value["description"] ?? ""
    }
}

// MARK: - Coordinates
struct Coordinates {
    let latitude, longitude: String
    
    init(value: [String: String]) {
        latitude = value["latitude"] ?? ""
        longitude = value["longitude"] ?? ""
    }
}

// MARK: - Street
struct Street {
    let number: Int
    let name: String
    
    init(value: [String: Any]) {
        number = value["number"] as? Int ?? 0
        name = value["name"] as? String ?? ""
    }
}

// MARK: - Login
struct Login {
    let uuid, username, password, salt, md5, sha1, sha256: String
    
    init(value: [String: String]) {
        uuid = value["uuid"] ?? ""
        username = value["username"] ?? ""
        password = value["password"] ?? ""
        salt = value["salt"] ?? ""
        md5 = value["md5"] ?? ""
        sha1 = value["sha1"] ?? ""
        sha256 = value["sha256"] ?? ""
    }
}

// MARK: - Dob
struct Dob {
    let date: String
    let age: Int
    
    init(value: [String: Any]) {
        date = value["date"] as? String ?? ""
        age = value["age"] as? Int ?? 0
    }
}

// MARK: - ID
struct ID {
    let name, value: String
    
    init(value: [String: String]) {
        name = value["name"] ?? ""
        self.value = value["value"] ?? ""
    }
}

// MARK: - Picture
struct Picture {
    let large, medium, thumbnail: String
    
    init(value: [String: String]) {
        large = value["large"] ?? ""
        medium = value["medium"] ?? ""
        thumbnail = value["thumbnail"] ?? ""
    }
}
