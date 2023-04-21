
//  Constant.swift

import Foundation
import UIKit

let screenHeight = UIScreen.main.bounds.size.height
let screenWidth =  UIScreen.main.bounds.size.width

let IS_IPAD = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
let IS_IPHONE = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
let IS_IPHONE_5 = IS_IPHONE && UIScreen.main.bounds.size.height == 568.0
let IS_IPHONE_6 = IS_IPHONE && UIScreen.main.bounds.size.height == 667.0
let IS_IPHONE_6_PLUS = IS_IPHONE && UIScreen.main.bounds.size.height == 736.0
let IS_IPHONE_4 = IS_IPHONE && (UIScreen.main.bounds.size.height == 460.0 || UIScreen.main.bounds.size.height == 480.0)
let IS_IPHONE_X = IS_IPHONE && (UIScreen.main.bounds.size.height == 812.0 || UIScreen.main.bounds.size.height == 896.0 || UIScreen.main.bounds.size.height == 926 || UIScreen.main.bounds.size.height == 844 || UIScreen.main.bounds.size.height == 780) //viewport size of actual device
//iPhone XR | iPhone XS Max - 896
//iPhone XS | iPhone X - 812
//iPhone 12 | iPhone 12 Pro - 844
//iPhone 12 Pro Max - 926
//iPhone 12 Mini - 780


let appColor = UIColor(red: 58.0/255.0, green: 135.0/255.0, blue: 235.0/255.0, alpha: 1.0)
let appColorBottom = UIColor(red: 33.0/255.0, green: 150.0/255.0, blue: 243.0/255.0, alpha: 1.0)

let appDateFormat               = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

let MonteserratRegular          = "Montserrat"
let SFProTextRegular            = "SFProText-Regular"
let SFProTextMedium             = "SFProText-Medium"
let SFProTextItalic             = "SFProText-Italic"
let SFProTextSemiBold           = "SFProText-Semibold"
let SFProDisplayBold            = "SFProDisplay-Bold"
let SFProSemiBold               = "SFProDisplay-Semibold"

//local
//let accountUrl: String          = "http://192.168.1.100/charge/"
//live
let accountUrl: String          = "https://chargeforstripe.com/app/"

let baseUrl: String             = "https://api.stripe.com/v1/"

let StripeClientId              = "ca_ANoZOkPNqbXBNRLXkbj5OzSX8Yq3rvRD"

//App Links Urls
let LicenseAggrement: String    = "https://chargeforstripe.com/eula/"
let PrivacyPolicy: String       = "https://chargeforstripe.com/privacy/"
let FAQURL: String              = "https://chargeforstripe.com/faq/"
let termsAndConditionsLearnMore = "https://support.chargeforstripe.com/en-au/"

//let NotificationsUrl            = "http://chargeforstripe.com/notifications/"
//let NotificationsAccounts       = "http://chargeforstripe.com/app/notification.php?account="

let NotificationsUrl            = "https://chargeforstripe.com/notifications/"
let NotificationsAccounts       = "https://chargeforstripe.com/app/notification.php?account="


let AboutUrl                    = "https://chargeforstripe.com/about?utm_medium=app"
let SupportUrl                     = "https://support.chargeforstripe.com"
let AboutPayoutUrl              = "https://stripe.com/docs/payouts"

//RT (Old)
//let TestModeSecreteKey          = "sk_test_ztcVe8r0xy94QSTnKZSPGHj700pL4PI4pP"
//let LiveModeSecreteKey          = "sk_live_DquF6zToNeGDwP3jQPGu5J8900s8oorOtT"

//New
let TestModeSecreteKey          = "sk_test_5103HTe2u0Hkz3jhz9p5zIYnN2mhDZZUsuNkEzVzFQoaHcbsAmCPM6sy7UuhzuMMHCVwN8Nie4CdV3LqDFJUGryQP00Kc8PJAHG"
//let LiveModeSecreteKey          = "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"


//let LiveModeSecreteKey          = "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" //Last active key & commented on 25th July 2022


let stripeLivePublickey: String = "pk_live_EFJ6KAPDBbC1scsRn0ojGkiT00z6JZDlO5"
let stripeTestPublickey: String = "pk_test_YLtWotUfC5kpU1Pxcjn7UEHE00kcqHYra4"

let sharedAppStoreId = "1400281070"
let appStoreApp = "https://apps.apple.com/in/app/charge-for-stripe-card-payment/id\(sharedAppStoreId)"

/*
let TestModeSecreteKey          = "sk_test_0lDjhxkqzp4uxXbrfwIeBThO"
let LiveModeSecreteKey          = "sk_live_GcraThU1ouNSqW7NwVdf0Fve"
let stripeLivePublickey: String = "pk_live_GFK0fVMLqqhNQLj1HXyr6hA5"
let stripeTestPublickey: String = "pk_test_g2sJ6ejHBFIKzWwVqmzUc40t"
*/

//Notification Status
let Push_ChargeCapture                  = "charge.captured"
let Push_ChargeSuccess                  = "charge.succeeded"
let Push_CustomerCreated                = "customer.created"
let Push_PayoutCreated                  = "payout.created"
let Push_PayoutPaid                     = "payout.paid"
let Push_BalanceAvailable               = "balance.available"
let Push_OrderPaymentSuccess            = "order.payment_succeeded"
let Push_InvoicePaymentSuccess          = "invoice.payment_succeeded"
let Push_ChargeRefund                   = "charge.refunded"


public func localize(str: String) -> String{return String.localizedStringWithFormat(NSLocalizedString(str, comment: "")) }

var arrKeyboard : [String] = ["1","2","3","4","5","6","7","8","9","CLEAR","0","Erase"]
