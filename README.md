# Blog data

This repository contains blog posts (wiki sites?) and other related data. In case your blog post is ready, put it in the `publish` directory, it will appear in http://openhouse.sk/blog (via Jenkins and `build` script). The `publish_not` directory holds blog posts that are not ready to be published yet. If you reference some code or other files in you blog post, store them to appropriate directory (`code` or `files`).

The blog posts are expected to be written in [MarkDown](http://daringfireball.net/projects/markdown/) and have an `.md` extension (ex. `blog-post.md`). The first two lines of a blog post have to look like this:

    # Blog entry title
    ###### tag1 [, tag2, tag3, .. , tagN]

