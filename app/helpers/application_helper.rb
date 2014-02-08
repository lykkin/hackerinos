module ApplicationHelper
    def title(pageTitle)
        if pageTitle.empty?
            "Hackerinos - Raise your hackers"
        else
            pageTitle
        end
    end
end
