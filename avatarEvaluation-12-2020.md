# Project Evaluation: December 2020

Site: http://avatar.newtfire.org/

GitHub repo: https://github.com/jer179/Avatar

Developers:
* Jayna Rowe @jer179
* Michael O'Malley @mjo43
* Rowyn Hope: @khope168
* Shannon Dunn (mentor): @smdunn921

Date of evaluation: 12 December 2020

Evaluated by: @haggis78

# General
This was a fun and well-executed project that dealt with a specific topic from the animated show *Avatar: The Last Airbender*, which was popular in its initial run and is currently enjoying a renaissance of popularity. 

# Research questions and goals
The team initially considered exploring a number of themes, including the possible relationships between the Nations/elements in the show and either a) specific martial arts or b) historical nations/peoples in the real world that provided inspiration for the Nations/elements. However, they settled on tracing a character arc, specifically that of Zuko. As a methodology, they located the important turning-points in the character's development by watching a YouTube video made by a fellow fan that brought these scenes together. 
On the negative side, this meant that the selection of scenes was done by someone else, and it is possible that if the team members had watched the series (or searched the episode scripts) from end to end, they might have made different choices, particularly by that they might have found additional scenes that they considered relevant. However, this seemed a reasonable price to pay: by using a pre-determined set of scenes, they could shave off a lot of time on research and go more quickly to the coding. In the future, another group working on this material should search the episode transcripts to decide whether they would add other scenes to the analysis.

# Coding
## XML and schema
Selected scenes were marked up with xml. The markup appears to be consistent across the xml files, though it appears to have been done without the benefit of a schema; an old schema was only applied at the last minute, and at that point the markup on the xml had changed significantly, so the schema cannot be used to validate the xml until it is rewritten to match the actual markup used. This is unfortunate, as any future users of the code will either have to fix the schema or write their own if they wish to extend the project by adding material.
## XPath and XSLT
The xml markup on the scripts was useful but not exceptionally complex -- this is not a bad thing -- and therefore any XPath would not need to be very complicated.

The XSLT was relatively straightforward but perfectly effective. It was used to render aspects of the script in ways that the reader could easily make out. For example, stage directions were rendered in bold italics. The name "Zuko" was rendered in red in the html for easy spotting, though only when indicated as the speaker of a line of dialogue. It was not rendered in red when Zuko showed up in stage directions, but that probably would ahve been overkill, as these are all scenes in which Zuko figures prominently. One miss, though: one scene includes a flashback to Zuko's boyhood, and he appears in the dialogue as "Young Zuko". This is part of his character arc, and so I would think "Young Zuko" ought to have been rendered in red as well.

## CSS
The CSS is where this project shines. It is not exceptionally elaborate, but it is cleverly done. The use of CSS to construct the timelines, rather than SVG, is an elegant solution, and one that I would recommend for future projects, especially for timelies that do not need to be proportional to the actual passage of time. (That is, it works fine for a TV series where events just happen in order and time is not measured as such, but would not be as good for a historical project in which events are separated by different spans of time, and those differences would matter.) The choice of colors to match the color scheme of each "Book" (season of the show) was a great idea on several levels. First, it provides some visual variety. Second, it helps the user to see instantly which season s/he is in. Third, insofar as it corresponds to the different elements that are significant to the different seasons, it puts the viewer in mind of that context without having to say a word.

One small issue that remains is that a few of the images in the Book 3 timeline are distorted. This problem was fixed for the other timelines but not here.
# GitHub :octocat:

The GitHub repo is fairly neat. It might have been neater had specific folders been made for html and XSLT, but there are not so many unfoldered files that it is hard to find one's way around. In other words, it is neat enough.
# “UX”: User Experience and Site Interface
The site interface is very clean and un-fussy. One minor drawback is that the summaries in the timelines are sometimes too short to communicate much to the user, such as "We learn more of Zuko's past and see more of his values and motivations." The summaries in the Book 3 timeline are fuller and easier to follow for someone not familiar with the series. Of course, most visitors to the site will probably be fans of the series already, which is why this remains a minor issue; still, in a series with 61 total episodes, remembering episodes in detail may be a bit much to expect.

# Future prospects
As mentioned above, future development could include searching the episode transcripts for other scenes that might belong alongside these. Another thought considered early in the project's development had been the arc of a different character; this could be added to the site. Further, only selected scenes were marked up in xml. An extension of this project might require following through with marking all the scripts for the series, or at least a larger number, using the same markup the team used here.

# Closing Comments
No project uses every available tool; there is no SVG or JavaScript here. This may be related to the fact that those were the last two topics in the semester, and so by the time we got to them, you had already made decisions about what to do with your site and did not need them. The CSS timeline obviated the need for SVG, and given what you were trying to do, there was no obvious need for JavaScript. If the project had been trying to follow the arcs of two or more characters, JavaScript could have been helpful to turn on and off the highlighting of characters' names in the scripts, but in the event that was unnecessary.

All in all, team, well done. :tada:
