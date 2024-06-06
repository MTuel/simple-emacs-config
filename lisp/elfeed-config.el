(provide 'elfeed-config)

(use-package elfeed)
(use-package elfeed-goodies)

(elfeed-goodies/setup)

(setq elfeed-feeds
      '("https://www.alvinashcraft.com/rss"
	"https://sergeytihon.com/rss"
	"https://psweekly.dowst.dev/rss"
	"https://www.jimmybogard.com/rss/"
	"https://blog.codinghorror.com/rss/"
	"http://norvig.com/rss-feed.xml"
	"https://blog.cleancoder.com/atom.xml"
	"https://martinfowler.com/feed.atom"
	"https://www.smashingmagazine.com/feed/"
	"https://css-tricks.com/feed/"
	"https://devblogs.microsoft.com/visualstudio/feed/"
	"https://devblogs.microsoft.com/dotnet/feed/"
	"https://devblogs.microsoft.com/commandline/feed/"
	"https://planet.scheme.org/atom.xml"
	"http://planet.lisp.org/rss20.xml"
	"https://danluu.com/atom.xml"))
