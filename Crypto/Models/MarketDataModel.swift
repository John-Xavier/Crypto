//
//  MarketDataModel.swift
//  Crypto
//
//  Created by John Xavier  on 21/02/2024.
//
//JSON Data:
/*
 URL: https://api.coingecko.com/api/v3/global
 JSON response:
 {
   "data": {
     "active_cryptocurrencies": 12840,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 950,
     "total_market_cap": {
       "btc": 39924874.08244587,
       "eth": 699967379.0016485,
       "ltc": 29934707490.772514,
       "bch": 7859904912.709266,
       "bnb": 5518851166.286284,
       "eos": 2708982701317.2837,
       "xrp": 3779807155560.827,
       "xlm": 18055188845703.234,
       "link": 110940072926.4726,
       "dot": 275955348754.34045,
       "yfi": 279215913.8020456,
       "usd": 2045504089506.9673,
       "aed": 7513136520759.094,
       "ars": 1713865284172749.8,
       "aud": 3124994326695.197,
       "bdt": 224482447178144.84,
       "bhd": 770766395967.1184,
       "bmd": 2045504089506.9673,
       "brl": 10082698757997.752,
       "cad": 2762958512389.2676,
       "chf": 1800951802581.8708,
       "clp": 1983423040390431.5,
       "cny": 14705538000283.477,
       "czk": 47894453458256.9,
       "dkk": 14101838150826.854,
       "eur": 1891878550368.6343,
       "gbp": 1620898350607.1123,
       "gel": 5400130796298.39,
       "hkd": 15997774981309.082,
       "huf": 732592402947652.1,
       "idr": 31983393689318016,
       "ils": 7525644778266.41,
       "inr": 169616044398106.38,
       "jpy": 307334603020165.7,
       "krw": 2728441166800911,
       "kwd": 629495701529.4132,
       "lkr": 637233094845519.1,
       "mmk": 4295327341681815,
       "mxn": 34889852338098.727,
       "myr": 9815862749521.576,
       "ngn": 3285918224424889.5,
       "nok": 21444011439784.957,
       "nzd": 3313518211104.6074,
       "php": 114393797544640.6,
       "pkr": 572229769039575.9,
       "pln": 8184532328057.967,
       "rub": 188873876295636.62,
       "sar": 7670959434289.104,
       "sek": 21217970964869.902,
       "sgd": 2748844534171.6704,
       "thb": 73469393134866.58,
       "try": 63412962740386.35,
       "twd": 64491675686020.47,
       "uah": 79021850575206.58,
       "vef": 204816324482.33264,
       "vnd": 50190267859153730,
       "zar": 38664257394138.79,
       "xdr": 1544026261419.349,
       "xag": 89422893180.15825,
       "xau": 1010376745.0119684,
       "bits": 39924874082445.87,
       "sats": 3992487408244586.5
     },
     "total_volume": {
       "btc": 1925987.4675331798,
       "eth": 33766628.715103865,
       "ltc": 1444058943.1150808,
       "bch": 379164085.1921037,
       "bnb": 266230975.69446588,
       "eos": 130682108645.5293,
       "xrp": 182338989880.57654,
       "xlm": 870987529452.4402,
       "link": 5351781189.400147,
       "dot": 13312165799.24772,
       "yfi": 13469456.399738753,
       "usd": 98675708608.19453,
       "aed": 362435877717.8987,
       "ars": 82677356766122.83,
       "aud": 150750629717.666,
       "bdt": 10829098147021.62,
       "bhd": 37181993760.653694,
       "bmd": 98675708608.19453,
       "brl": 486392302871.51294,
       "cad": 133285917375.39294,
       "chf": 86878435589.83316,
       "clp": 95680900851935.86,
       "cny": 709399404326.0316,
       "czk": 2310442280530.867,
       "dkk": 680276749065.9529,
       "eur": 91264768188.88461,
       "gbp": 78192605015.30557,
       "gel": 260503870725.6334,
       "hkd": 771737289860.7167,
       "huf": 35340469301757.086,
       "idr": 1542888157583203.5,
       "ils": 363039279676.0369,
       "inr": 8182327015702.172,
       "jpy": 14825910096392.264,
       "krw": 131620790645665.42,
       "kwd": 30367054621.337536,
       "lkr": 30740308711692.883,
       "mmk": 207207832689675,
       "mxn": 1683096563022.2651,
       "myr": 473520056683.5744,
       "ngn": 158513645065289.9,
       "nok": 1034465311058.3787,
       "nzd": 159845076401.54028,
       "php": 5518389863410.394,
       "pkr": 27604529483142.504,
       "pln": 394824205554.3664,
       "rub": 9111330393644.24,
       "sar": 370049300691.273,
       "sek": 1023561053202.9216,
       "sgd": 132605054985.99646,
       "thb": 3544184763934.831,
       "try": 3059059654513.2686,
       "twd": 3111097078853.464,
       "uah": 3812036916004.814,
       "vef": 9880398702.938519,
       "vnd": 2421193030922178.5,
       "zar": 1865174954060.2788,
       "xdr": 74484273210.10092,
       "xag": 4313786218.082722,
       "xau": 48740866.26701778,
       "bits": 1925987467533.1797,
       "sats": 192598746753317.97
     },
     "market_cap_percentage": {
       "btc": 49.177111891337475,
       "eth": 17.16173590985445,
       "usdt": 4.792489561833089,
       "bnb": 2.7869603948349506,
       "sol": 2.245907908395104,
       "xrp": 1.4437342979922765,
       "steth": 1.3976087853225694,
       "usdc": 1.3720702925120167,
       "ada": 1.0132750366856427,
       "avax": 0.6606376283831019
     },
     "market_cap_change_percentage_24h_usd": -0.565066017178507,
     "updated_at": 1708532264
   }
 }
 */

import Foundation
// MARK: - Welcome
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - DataClass
struct MarketDataModel : Codable{
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys:String,CodingKey{
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    var marketCap:String {
        
        if let item = totalMarketCap.first(where: {$0.key == "gbp"}){
            return "£\(item.value.formattedWithAbbreviations())"
        }
        return ""
            
    }
    var volume: String{
        if let item = totalVolume.first(where: {$0.key == "gbp"}){
            return "£\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var btcDominance:String{
        if let item = marketCapPercentage.first(where: {$0.key=="btc"}){
            return "\(item.value.asPercentString())"
        }
        return ""
    }
}
