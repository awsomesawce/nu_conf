# Nushell Environment Config File
#
# version = 0.80.0

#oh-my-posh init nu

const completionsDir = "~/_completions"

# Get cheatsheet from cht.sh
def chtsh [q: string ] {
    curl $"https://cht.sh/($q)"
}

# Open presearch at a query
def searchweb [q: string ] {
    start $"https://presearch.com/search?q=($q)"
}

# Open the nushell home page in the browser.
def openNushellSite [] {
    start "https://nushell.sh"
}

export alias ll = ls -l
export alias la = ls -a
alias lla = ls -la
alias dr = deno run
alias dra = deno run -A
alias g = git
alias gst = git status
alias sw = searchweb

# Use httpbin.org to get the date from one of the headers, then convert it to EST timezone.
def get_gmt_time [] {
    http head https://httpbin.org/headers | where name == "date" | get 0 | get value | date to-timezone EST
}


export module gh_api {
    export const ghApiUrl = "https://api.github.com"

    # Get data from gh api
    export def get_gh_api [
        asYaml: bool # Returns a yaml string instead.
    ] {
        if asYaml {
            http get $"($ghApiUrl)" | to yaml
        } else {
            http get $"($ghApiUrl)"
        }
    }
}
export use gh_api get_gh_api


#use ~/.cache/starship/init.nu
