module EdgarApi
    class Filing

        attr_reader :cik, :title, :summary, :link, :term, :date, :file_id

        def initialize(attributes)
            @cik = attributes[:cik]
            @title = attributes[:title]
            @summary = attributes[:summary]
            @link = attributes[:link]
            @term = attributes[:term]
            @date = attributes[:date]
            @file_id = attributes[:file_id]
        end

        def self.pull(action: "getcurrent", cik: "", type: "", company: "", dateb: "", owner: "include", start: "0", count: "40", output: "atom")
            url = "https://www.sec.gov/cgi-bin/browse-edgar?action=#{URI.escape(action)}&cik=#{URI.escape(cik)}&type=#{URI.escape(type)}&company=#{URI.escape(company)}&dateb=#{URI.escape(dateb)}&owner=#{URI.escape(owner)}&start=#{URI.escape(start)}&count=#{URI.escape(count)}&output=#{URI.escape(output)}"
            results = []
            open(url) do |rss|
                feed = RSS::Parser.parse(rss)
                feed.entries.each do |e|
                    filing = new({
                        "cik": e.title.content.match(/\((\w{10})\)/)[1],
                        "file_id": e.id.content.split('=').last,
                        "term":  e.category.term,
                        "title": e.title.content,
                        "summary": e.summary.content,
                        "date": DateTime.parse(e.updated.content.to_s),
                        "link": e.link.href                      
                    })
                    results << filing
                end       
            end
            results 
        end    
    end
end