import Foundation

enum Currency: String {
    case RUR = "RUR"
    case USD = "USD"
    case EUR = "EUR"
}

protocol Printable {
    func printClassInfo()
}

class Account: Printable {
    let id: Int
    var balance: Float
    let currency: Currency
    let description: String
    var offer: String?
    
    init(id: Int, balance: Float, description: String, optionalOffer: String? = nil, currency: String) {
        self.id = id
        self.balance = balance
        self.description = description
        if let _offer = optionalOffer {
            self.offer = _offer
        }
        self.currency = Currency(rawValue: currency)!
    }
    
    func printClassInfo() {
        print("\nAccount info\nId: \(id)\nBalance: \(balance)\nCurrency: \(currency.rawValue)\nDescription: \(description)")
        if let _offer = offer {
            print("Offer: \(_offer)\n")
        }
    }
}

class ReissueInfo: Printable {
    let date: Date
    let info: String
    let address: String
    
    init(date: Date, info: String, address: String = "Головной офис") {
        self.date = date
        self.info = info
        self.address = address
    }
    
    func printClassInfo() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd --- mm --- yyyy"
        print("Reissue info\ndate: \(dateFormatter.string(from: date))\nInfo: \(info)\nAddress: \(address)\n")
    }
}

class Card: Printable {
    let id: Int
    var balance: Float
    let currency: Currency
    var reissueInfo: ReissueInfo?
    
    init(id: Int, balance: Float, currency: String, optionalReissueInfo: ReissueInfo? = nil) {
        self.id = id
        self.balance = balance
        if let _reissueInfo = optionalReissueInfo {
            self.reissueInfo = _reissueInfo
        }
        
        self.currency = Currency(rawValue: currency)!
    }
    
    func printClassInfo() {
        print("\nCard info\nId: \(id)\nBalance: \(balance)\nCurrency: \(currency.rawValue)")
        if let _ = reissueInfo {
            reissueInfo?.printClassInfo()
        }
    }
}

class ServerResponce: Printable {
    var cards: [Card]
    var accounts: [Account]
    
    init(cards: [Card], accounts: [Account]) {
        self.cards = cards
        self.accounts = accounts
    }
    
    func printClassInfo() {
        print("\nServer responce:\n")
        for card in cards {
            card.printClassInfo()
        }
        for account in accounts {
            account.printClassInfo()
        }
    }
}


let ac1 = Account(id: 1, balance: 100, description: "Первый аккаунт", currency: "RUR")
let ac2 = Account(id: 2, balance: 200, description: "Второй аккаунт", optionalOffer: "Предложение для студентов", currency: "EUR")
let accs = [ac1, ac2]

var dateString = "16 --- 09 --- 2018"

var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd --- mm --- yyyy"

var date = dateFormatter.date(from: dateString)

let reissueInfo = ReissueInfo(date: date!, info: "Информация о перевыпуске")
let card1 = Card(id: 11, balance: 1000, currency: "USD", optionalReissueInfo: reissueInfo)
let card2 = Card(id: 12, balance: 2000, currency: "RUR")

let cards = [card1, card2]

let response = ServerResponce(cards: cards, accounts: accs)

var array: [Printable] = []
array.append(contentsOf: cards)
array.append(contentsOf: accs)
array.append(response)

for item in array {
    item.printClassInfo()
}
