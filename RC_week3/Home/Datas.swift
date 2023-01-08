//
//  Datas.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/05.
//

import UIKit

//temp Data
struct item{
    var itemImageName : String
    var itemTitle: String
    var itemPrice: String
    var itemLoc : String
    var itemTime : String
}

var appleMouse:item = item(itemImageName: "image1", itemTitle: "애플 마우스 정품 팝니다", itemPrice: "40,000원", itemLoc: "답십리동", itemTime: "21분 전")
var starbucksDiary:item = item(itemImageName: "image2", itemTitle: "스타벅스 프리퀀시 다이어리 (초록, 빨강) - 아직 한번도 사용안했습니다", itemPrice: "9,000원", itemLoc: "종로5가", itemTime: "29분 전")
var appleWatch : item = item(itemImageName: "Image3", itemTitle: "애플워치 SE 실착 3회", itemPrice: "120,000원", itemLoc: "하월곡동", itemTime: "31분 전")
var airMax : item = item(itemImageName: "Image4", itemTitle: "에어팟 맥스 블랙", itemPrice: "450,000원", itemLoc: "용두동", itemTime: "34분 전")
var magicKeyboard : item = item(itemImageName: "Image5", itemTitle: "매직 키보드 ", itemPrice: "70,000원", itemLoc: "창신동", itemTime: "37분 전")

var fixedData : [item] = [appleMouse, appleWatch, starbucksDiary, airMax, magicKeyboard]
