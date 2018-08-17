//
//  ViewController.swift
//  OBSLyricsBud
//
//  Created by Junshu Liu on 2018/8/13.
//  Copyright © 2018 Junshu Liu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var lyrics = ""
    //separate the lyrics by lines, and put them into the array.
    var lyricsArray: [String] = []
    
    var line = 0
    var lines: [String] = []
    
    @IBOutlet var currentSentenceField: NSTextField!
    @IBOutlet var nextSentenceField: NSTextField!
    
    @IBOutlet var restartButton: NSButton!
    @IBOutlet var previousButton: NSButton!
    @IBOutlet var nextButton: NSButton!
    @IBOutlet var applyButton: NSButton!
    
    @IBOutlet var lyricsField: NSTextField!
    
    @IBOutlet var currentSentencefilePathField: NSTextField!
    @IBOutlet var nextSentencefilePathField: NSTextField!
    
    @IBOutlet var clearButton: NSButton!
    
    var fileURLForCurrent: URL!
    var fileURLForNext: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fileNameForCurrent = "current"
        let DocumentDirURLForCurrent = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        fileURLForCurrent = DocumentDirURLForCurrent.appendingPathComponent(fileNameForCurrent).appendingPathExtension("txt")
        self.currentSentencefilePathField.stringValue = fileURLForCurrent.path
        
        let fileNameForNext = "next"
        let DocumentDirURLForNext = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        fileURLForNext = DocumentDirURLForNext.appendingPathComponent(fileNameForNext).appendingPathExtension("txt")
        self.nextSentencefilePathField.stringValue = fileURLForNext.path
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func updateLyricsApply(_ sender: Any) {
//        currentSentenceField.stringValue = currentSentence
        line = 0
        if lyricsField.stringValue == "" {
            print("Please add some lyrics")
        } else {
            self.lines.removeAll()
            // Thanks https://stackoverflow.com/questions/31183431/swift-delete-all-array-elements
            self.lines.append("...")
            lyrics = lyricsField.stringValue
            lyrics.enumerateLines { line, _ in
                self.lines.append(line)
            }
            self.lines.append("- END -")
            print(lyrics)
            
            currentSentenceField.stringValue = lines[0]
            nextSentenceField.stringValue = lines[1]
            //Thanks https://stackoverflow.com/questions/32021712/how-to-split-a-string-by-new-lines-in-swift
            writeCurrentFile()
            writeNextFile()
        }
    }
    
    @IBAction func updateLyricsRestart(_ sender: Any) {
        if lyricsField.stringValue == "" {
            print("Please add some lyrics")
        } else {
            line = 0
            currentSentenceField.stringValue = lines[line]
            nextSentenceField.stringValue = lines[line+1]
            writeCurrentFile()
            writeNextFile()
            print(line)
        }
    }
    
    @IBAction func updateLyricsPrevious(_ sender: Any) {
        if lyricsField.stringValue == "" {
            print("Please add some lyrics.")
        } else {
            line = line - 1
            if line >= 0 {
                currentSentenceField.stringValue = lines[line]
                nextSentenceField.stringValue = lines[line+1]
                writeCurrentFile()
                writeNextFile()
            } else {
                print("You've reached the very beginning.")
                print(line)
                line = line + 1
            }
            print(line)
        }
    }
    
    @IBAction func updateLyricsNext(_ sender: Any) {
        if lyricsField.stringValue == "" {
            print("Please add some lyrics.")
        } else {
            line = line + 1
            if line <= lines.count - 2 { // Thanks https://iswift.org/cookbook/get-the-size-of-an-array
                currentSentenceField.stringValue = lines[line]
                nextSentenceField.stringValue = lines[line+1]
                writeCurrentFile()
                writeNextFile()
            } else {
                print("You've reached the end.")
                print(line)
                line = line - 1
            }
            print(line)
        }
    }
    
    @IBAction func clearLyrics(_ sender: Any) {
        lyricsField.stringValue = ""
        currentSentenceField.stringValue = ""
        nextSentenceField.stringValue = ""
        writeCurrentFile()
        writeNextFile()
        self.lines.removeAll()
    }
    
    func writeCurrentFile() {
        let writeString = self.currentSentenceField.stringValue
        do {
            // Write to the file.
            try writeString.write(to: fileURLForCurrent, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write to URL.")
            print(error)
        }
    }
    
    func writeNextFile() {
        let writeString = self.nextSentenceField.stringValue
        do {
            // Write to the file.
            try writeString.write(to: fileURLForNext, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed to write to URL.")
            print(error)
        }
    }
}

