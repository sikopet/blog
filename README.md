# Blog posts

Blog posts (wiki sites?) and other related data rendered on OpenHouse [web site](http://openhouse.sk). Blog code was inspired by [Book](http://perladvent.org/2012/2012-12-22.html).

In case your blog post is ready, put it in the `publish` directory, it will appear in http://openhouse.sk/blog (via Jenkins and `build` script). The `publish_not` directory holds blog posts that are not ready to be published yet. If you reference some code or other files in you blog post, store them to appropriate directory (`code` or `files`).

The blog posts are expected to be written in [MarkDown](http://daringfireball.net/projects/markdown/) and have an `.md` extension (ex. `blog-post.md`). The first two lines of a blog post have to look like this:

    # Blog Entry Title
    ###### tag1 [, tag2, tag3, .. , tagN]

