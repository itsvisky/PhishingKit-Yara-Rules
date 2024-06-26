rule PK_RoyalMail_tr : RoyalMail
{
    meta:
        description = "Phishing Kit impersonating RoyalMail"
        licence = "AGPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2024-05-06"
        comment = "Phishing Kit - RoyalMail - contain turkish comments"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "files"
        // specific file found in PhishingKit
        $spec_file = "package.php"
        $spec_file2 = "continue.php"
        $spec_file3 = "997614747.html"
        $spec_file4 = "hcaptcha.html"
        $spec_file5 = "SafeSpace-logo.png"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        all of ($spec_dir*) and 
        // check for file
        all of ($spec_file*)
}
