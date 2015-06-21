//
// Created by MIGUEL MOLDES on 20/6/15.
// Copyright (c) 2015 MIGUEL MOLDES. All rights reserved.
//

import Foundation

class REDUserDefaults {

    static let sharedInstance = REDUserDefaults()

    func saveNewCombinations(name:NSString) -> Bool{
        var defaults = NSUserDefaults.standardUserDefaults();

        var languages = defaults.objectForKey("LanguagesAvailable") as? [String]
        var list = [NSString]();

        if(languages != nil){
            list = languages!;
        }
        if(contains(list, name)){
            return false;
        }
        list.append(name);

        defaults.setObject(list, forKey:"LanguagesAvailable");

        return true;
    }

    func getLanguagesCombinations() -> NSArray{
        var defaults = NSUserDefaults.standardUserDefaults();
        let languages = defaults.objectForKey("LanguagesAvailable") as? [String] ?? [String]()
        return languages
    }

    func clearLanguagesCombinations(){
        var defaults = NSUserDefaults.standardUserDefaults();
        var list = [];
        defaults.setObject(list, forKey:"LanguagesAvailable")
    }

}
