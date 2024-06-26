rule PK_DHL_amandz : DHL
{
    meta:
        description = "Phishing Kit impersonating DHL"
        licence = "AGPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2024-04-01"
        comment = "Phishing Kit - DHL - 'by @amandz741'"

    strings:
        $zip_file = { 50 4b 03 04 }
        $spec_dir = "app"
        $spec_dir2 = "send"
        $spec_file1 = "postrz.php"
        $spec_file2 = "postsmserr.php"
        $spec_file3 = "wow.min.js"
        $spec_file4 = "boshak.css"
        $spec_file5 = "loading_end.php"
        $spec_file6 = "titiza.png"
        $spec_file7 = "dhl-logo.svg"

    condition:
        uint32(0) == 0x04034b50 and
        $zip_file and
        all of ($spec_dir*) and
        // check for file
        all of ($spec_file*)
}
