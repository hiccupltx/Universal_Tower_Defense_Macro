#Requires AutoHotkey v2
Sleep 5000

class GithubClass {
    link := ''

    __new(github_user, repo) {
        this.link := 'https://github.com/' github_user '/' repo
    }

    GetLatestVersionURL(item) {
        return this.link '/releases/latest/download/' item
    }
}

macro_path := 'Salmon_UTD.exe'

MsgBox('Click ok to start updating / downloading')

try {
    g := GithubClass('hiccupltx', 'Universal_Tower_Defense_Macro')

    try FileDelete(macro_path)
    Download(g.GetLatestVersionURL('Salmon_UTD.exe'), macro_path)
} catch Error as e {
    MsgBox(e.Message)
    ExitApp()
}

MsgBox('Download / update complete')