//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func validate() throws {

  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var infoPlist: infoPlist { .init(source: .init(bundle: bundle, tableName: "InfoPlist", preferredLanguages: preferredLanguages, locale: locale)) }
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func infoPlist(preferredLanguages: [String]) -> infoPlist {
      .init(source: .init(bundle: bundle, tableName: "InfoPlist", preferredLanguages: preferredLanguages, locale: locale))
    }
    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.infoPlist` struct is generated, and contains static references to 2 localization keys.
    struct infoPlist {
      let source: RswiftResources.StringResource.Source

      /// en translation: Bluetooth permission is required for exercising with AirPods.
      ///
      /// Key: NSBluetoothAlwaysUsageDescription
      ///
      /// Locales: en, ko
      var nsBluetoothAlwaysUsageDescription: RswiftResources.StringResource { .init(key: "NSBluetoothAlwaysUsageDescription", tableName: "InfoPlist", source: source, developmentValue: "Bluetooth permission is required for exercising with AirPods.", comment: nil) }

      /// en translation: Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.
      ///
      /// Key: NSMotionUsageDescription
      ///
      /// Locales: en, ko
      var nsMotionUsageDescription: RswiftResources.StringResource { .init(key: "NSMotionUsageDescription", tableName: "InfoPlist", source: source, developmentValue: "Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.", comment: nil) }
    }

    /// This `_R.string.localizable` struct is generated, and contains static references to 58 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// en translation: Adjust AirPods Motion Sensitivity
      ///
      /// Key: Adjust AirPods Motion Sensitivity
      ///
      /// Locales: en, ko
      var adjustAirPodsMotionSensitivity: RswiftResources.StringResource { .init(key: "Adjust AirPods Motion Sensitivity", tableName: "Localizable", source: source, developmentValue: "Adjust AirPods Motion Sensitivity", comment: nil) }

      /// en translation: Adjust iPhone Motion Sensitivity
      ///
      /// Key: Adjust iPhone Motion Sensitivity
      ///
      /// Locales: en, ko
      var adjustIPhoneMotionSensitivity: RswiftResources.StringResource { .init(key: "Adjust iPhone Motion Sensitivity", tableName: "Localizable", source: source, developmentValue: "Adjust iPhone Motion Sensitivity", comment: nil) }

      /// en translation: AirPods
      ///
      /// Key: AirPods
      ///
      /// Locales: en, ko
      var airPods: RswiftResources.StringResource { .init(key: "AirPods", tableName: "Localizable", source: source, developmentValue: "AirPods", comment: nil) }

      /// en translation: AirPods Motion Sensitivity
      ///
      /// Key: AirPods Motion Sensitivity
      ///
      /// Locales: en, ko
      var airPodsMotionSensitivity: RswiftResources.StringResource { .init(key: "AirPods Motion Sensitivity", tableName: "Localizable", source: source, developmentValue: "AirPods Motion Sensitivity", comment: nil) }

      /// en translation: Please wear both AirPods during your workout.
      ///
      /// Key: AirpodsMotionSensorDescription
      ///
      /// Locales: en, ko
      var airpodsMotionSensorDescription: RswiftResources.StringResource { .init(key: "AirpodsMotionSensorDescription", tableName: "Localizable", source: source, developmentValue: "Please wear both AirPods during your workout.", comment: nil) }

      /// en translation: AirPods Motion Sensor
      ///
      /// Key: AirpodsMotionSensorHeadline
      ///
      /// Locales: en, ko
      var airpodsMotionSensorHeadline: RswiftResources.StringResource { .init(key: "AirpodsMotionSensorHeadline", tableName: "Localizable", source: source, developmentValue: "AirPods Motion Sensor", comment: nil) }

      /// en translation: Blop
      ///
      /// Key: Blop
      ///
      /// Locales: en, ko
      var blop: RswiftResources.StringResource { .init(key: "Blop", tableName: "Localizable", source: source, developmentValue: "Blop", comment: nil) }

      /// en translation: Bluetooth
      ///
      /// Key: Bluetooth
      ///
      /// Locales: en, ko
      var bluetooth: RswiftResources.StringResource { .init(key: "Bluetooth", tableName: "Localizable", source: source, developmentValue: "Bluetooth", comment: nil) }

      /// en translation: Bluetooth permission is required for exercising with AirPods.
      ///
      /// Key: Bluetooth Permission Description
      ///
      /// Locales: en, ko
      var bluetoothPermissionDescription: RswiftResources.StringResource { .init(key: "Bluetooth Permission Description", tableName: "Localizable", source: source, developmentValue: "Bluetooth permission is required for exercising with AirPods.", comment: nil) }

      /// en translation: Choose Your Device
      ///
      /// Key: Choose Your Device
      ///
      /// Locales: en, ko
      var chooseYourDevice: RswiftResources.StringResource { .init(key: "Choose Your Device", tableName: "Localizable", source: source, developmentValue: "Choose Your Device", comment: nil) }

      /// en translation: Coin
      ///
      /// Key: Coin
      ///
      /// Locales: en, ko
      var coin: RswiftResources.StringResource { .init(key: "Coin", tableName: "Localizable", source: source, developmentValue: "Coin", comment: nil) }

      /// en translation: Confirm
      ///
      /// Key: Confirm
      ///
      /// Locales: en, ko
      var confirm: RswiftResources.StringResource { .init(key: "Confirm", tableName: "Localizable", source: source, developmentValue: "Confirm", comment: nil) }

      /// en translation: Would you like to finish your workout?
      ///
      /// Key: Confirm Finish Workout
      ///
      /// Locales: en, ko
      var confirmFinishWorkout: RswiftResources.StringResource { .init(key: "Confirm Finish Workout", tableName: "Localizable", source: source, developmentValue: "Would you like to finish your workout?", comment: nil) }

      /// en translation: Contact Developer
      ///
      /// Key: Contact Developer
      ///
      /// Locales: en, ko
      var contactDeveloper: RswiftResources.StringResource { .init(key: "Contact Developer", tableName: "Localizable", source: source, developmentValue: "Contact Developer", comment: nil) }

      /// en translation: Correct 1
      ///
      /// Key: Correct1
      ///
      /// Locales: en, ko
      var correct1: RswiftResources.StringResource { .init(key: "Correct1", tableName: "Localizable", source: source, developmentValue: "Correct 1", comment: nil) }

      /// en translation: Correct 2
      ///
      /// Key: Correct2
      ///
      /// Locales: en, ko
      var correct2: RswiftResources.StringResource { .init(key: "Correct2", tableName: "Localizable", source: source, developmentValue: "Correct 2", comment: nil) }

      /// en translation: The Mail app is not installed on your iPhone. Please install the default Mail app or an email app such as Gmail, or send your inquiry to krpeppermint100@gmail.com.
      ///
      /// Key: Email App Does Not Exist
      ///
      /// Locales: en, ko
      var emailAppDoesNotExist: RswiftResources.StringResource { .init(key: "Email App Does Not Exist", tableName: "Localizable", source: source, developmentValue: "The Mail app is not installed on your iPhone. Please install the default Mail app or an email app such as Gmail, or send your inquiry to krpeppermint100@gmail.com.", comment: nil) }

      /// en translation: Etc
      ///
      /// Key: Etc
      ///
      /// Locales: en, ko
      var etc: RswiftResources.StringResource { .init(key: "Etc", tableName: "Localizable", source: source, developmentValue: "Etc", comment: nil) }

      /// en translation: Finish
      ///
      /// Key: Finish
      ///
      /// Locales: en, ko
      var finish: RswiftResources.StringResource { .init(key: "Finish", tableName: "Localizable", source: source, developmentValue: "Finish", comment: nil) }

      /// en translation: Finish Workout
      ///
      /// Key: Finish Workout
      ///
      /// Locales: en, ko
      var finishWorkout: RswiftResources.StringResource { .init(key: "Finish Workout", tableName: "Localizable", source: source, developmentValue: "Finish Workout", comment: nil) }

      /// en translation: Haptic Feedback
      ///
      /// Key: Haptic Feedback
      ///
      /// Locales: en, ko
      var hapticFeedback: RswiftResources.StringResource { .init(key: "Haptic Feedback", tableName: "Localizable", source: source, developmentValue: "Haptic Feedback", comment: nil) }

      /// en translation: High
      ///
      /// Key: High
      ///
      /// Locales: en, ko
      var high: RswiftResources.StringResource { .init(key: "High", tableName: "Localizable", source: source, developmentValue: "High", comment: nil) }

      /// en translation: Home
      ///
      /// Key: Home
      ///
      /// Locales: en, ko
      var home: RswiftResources.StringResource { .init(key: "Home", tableName: "Localizable", source: source, developmentValue: "Home", comment: nil) }

      /// en translation: Interval
      ///
      /// Key: Interval
      ///
      /// Locales: en, ko
      var interval: RswiftResources.StringResource { .init(key: "Interval", tableName: "Localizable", source: source, developmentValue: "Interval", comment: nil) }

      /// en translation: Jump High
      ///
      /// Key: JumpHigh
      ///
      /// Locales: en, ko
      var jumpHigh: RswiftResources.StringResource { .init(key: "JumpHigh", tableName: "Localizable", source: source, developmentValue: "Jump High", comment: nil) }

      /// en translation: Low
      ///
      /// Key: Low
      ///
      /// Locales: en, ko
      var low: RswiftResources.StringResource { .init(key: "Low", tableName: "Localizable", source: source, developmentValue: "Low", comment: nil) }

      /// en translation: Mario Jumping
      ///
      /// Key: MarioJumping
      ///
      /// Locales: en, ko
      var marioJumping: RswiftResources.StringResource { .init(key: "MarioJumping", tableName: "Localizable", source: source, developmentValue: "Mario Jumping", comment: nil) }

      /// en translation: Medium
      ///
      /// Key: Medium
      ///
      /// Locales: en, ko
      var medium: RswiftResources.StringResource { .init(key: "Medium", tableName: "Localizable", source: source, developmentValue: "Medium", comment: nil) }

      /// en translation: Motion
      ///
      /// Key: Motion
      ///
      /// Locales: en, ko
      var motion: RswiftResources.StringResource { .init(key: "Motion", tableName: "Localizable", source: source, developmentValue: "Motion", comment: nil) }

      /// en translation: Motion Sensor
      ///
      /// Key: Motion Sensor
      ///
      /// Locales: en, ko
      var motionSensor: RswiftResources.StringResource { .init(key: "Motion Sensor", tableName: "Localizable", source: source, developmentValue: "Motion Sensor", comment: nil) }

      /// en translation: Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.
      ///
      /// Key: Motion Sensor Description
      ///
      /// Locales: en, ko
      var motionSensorDescription: RswiftResources.StringResource { .init(key: "Motion Sensor Description", tableName: "Localizable", source: source, developmentValue: "Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.", comment: nil) }

      /// en translation: Motion and fitness permissions are required to count squats.
      ///
      /// Key: MotionFitnessPermissionDescription
      ///
      /// Locales: en, ko
      var motionFitnessPermissionDescription: RswiftResources.StringResource { .init(key: "MotionFitnessPermissionDescription", tableName: "Localizable", source: source, developmentValue: "Motion and fitness permissions are required to count squats.", comment: nil) }

      /// en translation: Motion & Fitness Permission Required
      ///
      /// Key: MotionFitnessPermissionHeadline
      ///
      /// Locales: en, ko
      var motionFitnessPermissionHeadline: RswiftResources.StringResource { .init(key: "MotionFitnessPermissionHeadline", tableName: "Localizable", source: source, developmentValue: "Motion & Fitness Permission Required", comment: nil) }

      /// en translation: Next
      ///
      /// Key: Next
      ///
      /// Locales: en, ko
      var next: RswiftResources.StringResource { .init(key: "Next", tableName: "Localizable", source: source, developmentValue: "Next", comment: nil) }

      /// en translation: No AirPods Connected
      ///
      /// Key: No AirPods Connected
      ///
      /// Locales: en, ko
      var noAirPodsConnected: RswiftResources.StringResource { .init(key: "No AirPods Connected", tableName: "Localizable", source: source, developmentValue: "No AirPods Connected", comment: nil) }

      /// en translation: Please allow the following permissions to use the app.
      ///
      /// Key: Onboarding Permission Title
      ///
      /// Locales: en, ko
      var onboardingPermissionTitle: RswiftResources.StringResource { .init(key: "Onboarding Permission Title", tableName: "Localizable", source: source, developmentValue: "Please allow the following permissions to use the app.", comment: nil) }

      /// en translation: Privacy Policy
      ///
      /// Key: Privacy Policy
      ///
      /// Locales: en, ko
      var privacyPolicy: RswiftResources.StringResource { .init(key: "Privacy Policy", tableName: "Localizable", source: source, developmentValue: "Privacy Policy", comment: nil) }

      /// en translation: This app does not collect any personal information.
      ///
      /// Key: Privacy Policy Description
      ///
      /// Locales: en, ko
      var privacyPolicyDescription: RswiftResources.StringResource { .init(key: "Privacy Policy Description", tableName: "Localizable", source: source, developmentValue: "This app does not collect any personal information.", comment: nil) }

      /// en translation: Return
      ///
      /// Key: Return
      ///
      /// Locales: en, ko
      var `return`: RswiftResources.StringResource { .init(key: "Return", tableName: "Localizable", source: source, developmentValue: "Return", comment: nil) }

      /// en translation: The higher the sensitivity, the more easily the device will detect squat movements with even slight motions.
      ///
      /// Key: Sensitivity Description
      ///
      /// Locales: en, ko
      var sensitivityDescription: RswiftResources.StringResource { .init(key: "Sensitivity Description", tableName: "Localizable", source: source, developmentValue: "The higher the sensitivity, the more easily the device will detect squat movements with even slight motions.", comment: nil) }

      /// en translation: Set Goal
      ///
      /// Key: Set Goal
      ///
      /// Locales: en, ko
      var setGoal: RswiftResources.StringResource { .init(key: "Set Goal", tableName: "Localizable", source: source, developmentValue: "Set Goal", comment: nil) }

      /// en translation: Setting
      ///
      /// Key: Setting
      ///
      /// Locales: en, ko
      var setting: RswiftResources.StringResource { .init(key: "Setting", tableName: "Localizable", source: source, developmentValue: "Setting", comment: nil) }

      /// en translation: Sound
      ///
      /// Key: Sound
      ///
      /// Locales: en, ko
      var sound: RswiftResources.StringResource { .init(key: "Sound", tableName: "Localizable", source: source, developmentValue: "Sound", comment: nil) }

      /// en translation: Sound Feedback
      ///
      /// Key: Sound Feedback
      ///
      /// Locales: en, ko
      var soundFeedback: RswiftResources.StringResource { .init(key: "Sound Feedback", tableName: "Localizable", source: source, developmentValue: "Sound Feedback", comment: nil) }

      /// en translation: Sound Setting
      ///
      /// Key: Sound Setting
      ///
      /// Locales: en, ko
      var soundSetting: RswiftResources.StringResource { .init(key: "Sound Setting", tableName: "Localizable", source: source, developmentValue: "Sound Setting", comment: nil) }

      /// en translation: Stapler
      ///
      /// Key: Stapler
      ///
      /// Locales: en, ko
      var stapler: RswiftResources.StringResource { .init(key: "Stapler", tableName: "Localizable", source: source, developmentValue: "Stapler", comment: nil) }

      /// en translation: Start
      ///
      /// Key: Start
      ///
      /// Locales: en, ko
      var start: RswiftResources.StringResource { .init(key: "Start", tableName: "Localizable", source: source, developmentValue: "Start", comment: nil) }

      /// en translation: This feature is supported on AirPods (3rd generation), AirPods Pro, AirPods Max, and Beats Fit Pro with motion sensors.
      ///
      /// Key: Supported Heaphones Description
      ///
      /// Locales: en, ko
      var supportedHeaphonesDescription: RswiftResources.StringResource { .init(key: "Supported Heaphones Description", tableName: "Localizable", source: source, developmentValue: "This feature is supported on AirPods (3rd generation), AirPods Pro, AirPods Max, and Beats Fit Pro with motion sensors.", comment: nil) }

      /// en translation: Time
      ///
      /// Key: Time
      ///
      /// Locales: en, ko
      var time: RswiftResources.StringResource { .init(key: "Time", tableName: "Localizable", source: source, developmentValue: "Time", comment: nil) }

      /// en translation: Very High
      ///
      /// Key: Very High
      ///
      /// Locales: en, ko
      var veryHigh: RswiftResources.StringResource { .init(key: "Very High", tableName: "Localizable", source: source, developmentValue: "Very High", comment: nil) }

      /// en translation: Very Low
      ///
      /// Key: Very Low
      ///
      /// Locales: en, ko
      var veryLow: RswiftResources.StringResource { .init(key: "Very Low", tableName: "Localizable", source: source, developmentValue: "Very Low", comment: nil) }

      /// en translation: Vibrate
      ///
      /// Key: Vibrate
      ///
      /// Locales: en, ko
      var vibrate: RswiftResources.StringResource { .init(key: "Vibrate", tableName: "Localizable", source: source, developmentValue: "Vibrate", comment: nil) }

      /// en translation: Woosh
      ///
      /// Key: Woosh
      ///
      /// Locales: en, ko
      var woosh: RswiftResources.StringResource { .init(key: "Woosh", tableName: "Localizable", source: source, developmentValue: "Woosh", comment: nil) }

      /// en translation: Result
      ///
      /// Key: Workout Result
      ///
      /// Locales: en, ko
      var workoutResult: RswiftResources.StringResource { .init(key: "Workout Result", tableName: "Localizable", source: source, developmentValue: "Result", comment: nil) }

      /// en translation: iPhone
      ///
      /// Key: iPhone
      ///
      /// Locales: en, ko
      var iPhone: RswiftResources.StringResource { .init(key: "iPhone", tableName: "Localizable", source: source, developmentValue: "iPhone", comment: nil) }

      /// en translation: iPhone Motion Sensitivity
      ///
      /// Key: iPhone Motion Sensitivity
      ///
      /// Locales: en, ko
      var iPhoneMotionSensitivity: RswiftResources.StringResource { .init(key: "iPhone Motion Sensitivity", tableName: "Localizable", source: source, developmentValue: "iPhone Motion Sensitivity", comment: nil) }

      /// en translation: Please hold your iPhone properly during your workout.
      ///
      /// Key: iPhoneMotionSensorDescription
      ///
      /// Locales: en, ko
      var iPhoneMotionSensorDescription: RswiftResources.StringResource { .init(key: "iPhoneMotionSensorDescription", tableName: "Localizable", source: source, developmentValue: "Please hold your iPhone properly during your workout.", comment: nil) }

      /// en translation: iPhone Motion Sensor
      ///
      /// Key: iPhoneMotionSensorHeadline
      ///
      /// Locales: en, ko
      var iPhoneMotionSensorHeadline: RswiftResources.StringResource { .init(key: "iPhoneMotionSensorHeadline", tableName: "Localizable", source: source, developmentValue: "iPhone Motion Sensor", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `backgroundColor`.
    var backgroundColor: RswiftResources.ColorResource { .init(name: "backgroundColor", path: [], bundle: bundle) }

    /// Color `descriptionLabel`.
    var descriptionLabel: RswiftResources.ColorResource { .init(name: "descriptionLabel", path: [], bundle: bundle) }

    /// Color `lightGray`.
    var lightGray: RswiftResources.ColorResource { .init(name: "lightGray", path: [], bundle: bundle) }
  }

  /// This `_R.file` struct is generated, and contains static references to 8 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `Blop.mp3`.
    var blopMp3: RswiftResources.FileResource { .init(name: "Blop", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Coin.mp3`.
    var coinMp3: RswiftResources.FileResource { .init(name: "Coin", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Correct1.mp3`.
    var correct1Mp3: RswiftResources.FileResource { .init(name: "Correct1", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Correct2.mp3`.
    var correct2Mp3: RswiftResources.FileResource { .init(name: "Correct2", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `JumpHigh.mp3`.
    var jumpHighMp3: RswiftResources.FileResource { .init(name: "JumpHigh", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `MarioJumping.mp3`.
    var marioJumpingMp3: RswiftResources.FileResource { .init(name: "MarioJumping", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Stapler.mp3`.
    var staplerMp3: RswiftResources.FileResource { .init(name: "Stapler", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Woosh.mp3`.
    var wooshMp3: RswiftResources.FileResource { .init(name: "Woosh", pathExtension: "mp3", bundle: bundle, locale: LocaleReference.none) }
  }
}