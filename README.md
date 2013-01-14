# OH Blog

In case your blog entry is ready, put it in the `publish` directory, it will appear in http://openhouse.sk/blog (via Jenkins and `build` script). The `publish_not` directory holds blog entries that are not ready to be published yet. If you reference some code or other files in you blog entry, store them to appropriate directory (`code` or `files`).

The blog entries are expected to be written in [MarkDown](http://daringfireball.net/projects/markdown/) and have an `.md` extension. The first two lines of a blog entry have to look like this:

    # Blog entry title
    ###### tag1 [, tag2, tag3, .. , tagN]

