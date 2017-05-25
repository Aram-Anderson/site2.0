---
layout: post
title:  "Changing Themes in Jekyll"
date:   2017-01-15 00:14:45
categories:  tech
comments: true
---

After my site had been up for a brief period, I decided that I wanted to change the theme I was using. I was worried that would be a lot of work, but it really wasn't.

I decided on <a href='https://github.com/joshgerdes/jekyll-uno'> Josh Gerdes' Uno Theme</a> for a few reasons. I really liked the simplicity of the theme, and the fact that it was very blog-centric. It had nothing I didn't need built into it, and therefore nothing to wrestle with in trying to get it to do what I need it to do. I also like the split screen layout, and the animation that takes you from the home page to the blog section.

All I really had to do was populate the \_posts directory with the posts from my old layout, and do a few simple tweaks to the yaml front matter. Most of what I needed was already there, and what wasn't was fairly obvious. I also changed the background image, avatar image, and the needed site info and username stuff for the social and email links. All the username stuff is just stashed in the \_config.yml file, so that was pretty easy.

The only thing I had a little trouble with was adding an "about me" page. This theme does not technically use different pages, and I was a little unfamiliar with the code that it used to navigate to the blog posts when the blog button is clicked. It looks like this:

{% highlight html %}
{% raw %}
<li class="navigation__item"><a href="{{ site.baseurl }}#blog" title="link to {{ site.title }} blog" class="blog-button">Blog</a></li>
{% endraw %}
{% endhighlight %}

Because there is no actual "blog" page in the code for this theme, I wasn't exactly sure how to go about adding an about me page, since I didn't have that example to work from.

I just ended up creating a new folder titled pages, and adding in an aboutme.md file. I then added a "permalink: /aboutme" to the yaml front matter in the page. Once that was done, it was just a matter of pointing a new link in the nav list in the header.html file at my new page. That looks like this:

{% highlight html %}
{% raw %}
<li class="navigation__item"><a href="/aboutme" title="link to {{ site.title }} aboutme" class="blog-button">Who Am I?</a></li>
{% endraw %}
{% endhighlight %}

It was a fairly cargo cult-esque solution, but it works and I think I understand what's going on here. The only thing that was throwing me at the get go was the fact that "blog" didn't actually have it's own page. It seems to work just the same though if I do the same sort of nav but to an actual page.

As an interesting little aside here, in writing this post I was having some trouble getting my code snippets to show up as raw code. Even though it was part of a snippet, Jekyll wanted to process the liquid tags. I found a solution, and that is to wrap your code snippet in {% raw %}{% raw %} and {% \endraw %} {% endraw %} tags (just pretend that \ isn't in the endraw tag. It was the only way I could get it to show up). Those tags go just below the highlight <language> tag, and just above the endhighlight tag.

Well folks, I think that's all I got for now. Feel free to comment, or to contact me. Have a good one!
