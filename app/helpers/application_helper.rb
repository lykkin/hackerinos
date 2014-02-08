module ApplicationHelper
    def title(pageTitle)
        if pageTitle.empty?
            "Raise your hackerinos"
        else
            pageTitle
        end
    end
end
