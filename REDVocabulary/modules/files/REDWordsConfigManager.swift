//
// Created by MIGUEL MOLDES on 20/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDWordsConfigManager {

    static let sharedInstance = REDWordsConfigManager()

    var filePath : String!;

    func createLanguagesFile(name:String)->Bool{

        createFile(name);
        return true;
    }

    func createFile(name:String){
        var error : NSErrorPointer = nil;
        var fm : NSFileManager = NSFileManager.defaultManager()
        var content : String = ""
        var fileContent : NSData = content.dataUsingEncoding(NSUTF8StringEncoding)!
        var dir : String = NSSearchPathForDirectoriesInDomains(.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
        var newDir : String = dir.stringByAppendingString("/RED")
        self.filePath = newDir.stringByAppendingString(name);

        if(!fm.fileExistsAtPath(newDir)){
            if(!fm.createDirectoryAtPath(newDir, withIntermediateDirectories: true, attributes: nil, error: error)){
                NSLog("Couldn't create directory");
                NSLog("Error was code: %d - message: %s", errno, strerror(errno));
            }
        }

        if(!fm.fileExistsAtPath(self.filePath)){
            if(!fm.createFileAtPath(self.filePath, contents: fileContent, attributes: nil)){
                NSLog("Couldn't create file");
                NSLog("Error was code: %d - message: %s", errno, strerror(errno));
            }
        }
    }

}
