import UIKit

/// Create base interface
protocol TV {
    var upgrades: [String] { get }
    var price: Int { get }
}

/// Decorator store to base interface and return the same value
protocol TVDecorator: TV {
    var tv: TV { get }
}

struct BaseTV: TV {
    var upgrades: [String] = ["Plain TV"]
    var price: Int = 40_000
}

struct USBTV: TVDecorator {
    var tv: TV
    
    var upgrades: [String] {
        tv.upgrades + ["USB TV"]
    }
    
    var price: Int {
        tv.price + 2_000
    }
}

struct WIFITV: TVDecorator {
    var tv: TV
    
    var upgrades: [String] {
        tv.upgrades + ["WIFI TV"]
    }
    
    var price: Int {
        tv.price + 3_000
    }
}

struct CabelTV: TVDecorator {
    var tv: TV
    
    var upgrades: [String] {
        tv.upgrades + ["Cabel TV"]
    }
    
    var price: Int {
        tv.price + 4_000
    }
}

struct GamingTV: TVDecorator {
    var tv: TV
    
    var upgrades: [String] {
        tv.upgrades + ["Gaming TV"]
    }
    
    var price: Int {
        tv.price + 5_000
    }
}


/// Simpel TV System
var tv = BaseTV()
tv.price

/// Now upgrade to USB TV then price goes up
var usbTV = USBTV(tv: tv)
usbTV.price

/// Now upgrade to WIFI TV then price goes up
var wifiTV = WIFITV(tv: usbTV)
wifiTV.price

/// Now upgrade to Cable TV then price goes up
var cableTV = CabelTV(tv: wifiTV)
cableTV.price

/// Now upgrade to Gaming TV then price goes up
var gamingTV = GamingTV(tv: cableTV)
gamingTV.price
gamingTV.upgrades.forEach { print($0) }

