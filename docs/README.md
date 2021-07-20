# The Jekyll template

The template is a simplified version of the [Bulma Clean Template](https://github.com/chrisrhymes/bulma-clean-theme), see a [demo here](http://www.csrhymes.com/bulma-clean-theme/).

The template is using the [Bulma](https://bulma.io/) CSS framework, and [Jekyll](https://jekyllrb.com/) as the build engine. Jekyll is the default website builder for [GitHub pages](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll).

You have the following files in the template:

```
docs
├── _layouts
│   └── default.html
└── methods
│   └── index.md
└── species
│   ├── ALFL
│   │   └── index.md
│   ├── AMCR
│   │   └── index.md
│   ├── AMGO
│   │   └── index.md
│   └── index.md
├── favicon.ico
├── index.md
├── 404.md
├── _config.yml
└── README.md
```

The `_config.yml` file has the site configuration options, explained inside the file.

The `favicon.ico` is a small PNG file that is displayed in the browser tab.

`index.md` is the landing page (will be the `index.html` of the site).

`404.md` will be displayed for any URL path that does not match an existing page (page not found error).

The `methods/index.md` is just a placeholder, so you can see how to create a folder with an index file, which will be available at `https://sitename.tld/reponame/methods/`.

The `species` directory is produced by the R scipt, and explained there.

The `_layouts` folder contains the layouts, the default layout defines how the page is built based on configuration options. The markdown content gets injected into the `{{ content }}` component of the template.

