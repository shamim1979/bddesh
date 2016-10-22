class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }		
		profile: "/profile/$action/$id/$title?" {
			controller = "profile"
			action = "of"
		}
		news: "/news/$action/$id/$title?" {
			controller = "news"
			action = "article"
		}
		topten: "/topTenz/$action/$id/$title?" {
			controller = "topTenz"
			action = "topList"
		}
		poll: "/pollz/$action/$id/$title?" {
			controller = "pollz"
			action = "result"
		}
		question: "/ask/$action/$id/$title?" {
			controller = "ask"
			action = "answer"
		}
		quote: "/quoteDay/quote/$id/$title?" {
			controller = "quoteDay"
			action = "quote"
		}
		newsSource: "/linkz/newsSource/$id/$title?" {
			controller = "linkz"
			action = "newsSource"
		}
		newsSourceItem: "/linkz/newsSourceItem/$id/$title?" {
			controller = "linkz"
			action = "newsSourceItem"
		}
		source: "/newspapers/newsSource/$id/$title?" {
			controller = "newspapers"
			action = "newsSource"
		}
		sourceList: "/newspapers/newsSourceList/$id/$title?" {
			controller = "newspapers"
			action = "newsSourceList"
		}				
		// start redirect solution
		hashword: "/hashword/article/$id/$title?" {
			controller = "hashword"
			action = "article"
		}		
		source: "/newspaper/source/$id/$title?" {
			controller = "newspaper"
			action = "source"
		}
		continent: "/newspaper/continent/$id/$title?" {
			controller = "newspaper"
			action = "continent"
		}
		country: "/newspaper/country/$id/$title?" {
			controller = "newspaper"
			action = "country"
		}
		language: "/newspaper/language/$id/$title?" {
			controller = "newspaper"
			action = "language"
		}
		continent: "/newspaper/tagWord/$id/$title?" {
			controller = "newspaper"
			action = "tagWord"
		}
		continent: "/newspaper/continent" {
			controller = "newspaper"
			action = "continent"
		}
		country: "/newspaper/country" {
			controller = "newspaper"
			action = "country"
		}
		language: "/newspaper/language" {
			controller = "newspaper"
			action = "language"
		}
		continent: "/newspaper/tagWord" {
			controller = "newspaper"
			action = "tagWord"
		}
		// end redirect solution
        "/"(controller:"home")
        "500"(controller: "Errors", action:"notFound")
		"404"(controller:"Errors", action:"notFound")
	}
}
