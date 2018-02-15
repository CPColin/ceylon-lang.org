---
layout: code
title: Building the website
tab: code
unique_id: codepage
author: Emmanuel Bernard
---

# Port from Awestruct to Ceylon

This fork is attempting to port the website from its current Awestruct architecture to one that uses
the `ceylon.html` and `ceylon.markdown` modules. The goal is to have a server module that
developers can run while updating the code and an export module that generates static HTML for
release.

## Running the server module

Run the `org.ceylonlang.server` module and the server will start. Once the console says
"Httpd started," you should be able to hit `localhost:8080` in your browser and see something
pretty close to <http://ceylon-lang.org/>.

## Main functionality

- If a Markdown file exists at the requested path, after replacing the the trailing slash with
  `.md`, it will be parsed by the `ceylon.markdown` module and rendered as `ceylon.html`
  elements.
- Certain HAML pages like `/`, `/download-archive/`, `/blog/`, and `/community/team/` have
  been converted to Ceylon.
- Static content like images, CSS, and JS are still served statically.
- Some of the HAML in the `_layouts` directory has been implemented in the
  `org.ceylonlang.site.layouts` package.
- Some shared functionality has been implemented in the `org.ceylonlang.site.partials` package.
- Pages can be analyzed to extract a table of contents comprised of links that anchor to each
  heading element in the page.

## Exporting the site to static HTML

Run the `org.ceylonlang.exporter` module and relax for a bit while it converts the Markdown
source and Ceylon pages to static HTML. Once it's finished, navigate to the new `_site` directory
and run the following command to start a simple server: `python ../testSite.py 4242`. You should
now be able to hit `localhost:4242` and see the exported site. Note that, since this is a Python
simple server, the generated `.htacess` file will not be in effect.

## Tasks to be done

- [X] Reorganize the code into three modules: `site`, which defines what the site is, `server`,
      which defines how to serve the site dynamically, and `exporter`, which exports the site as
      static content.
- [ ] Protect against path traversal attacks when serving static content and Markdown pages.
      Since we plan to serve the site statically, we can put this off until later.
- [x] Improve `run.ceylon` so all Ceylon pages can share a common endpoint.
- [ ] Show correct 404 page when static content doesn't exist.
      This can also be postponed, as long as the site is served statically.
- [x] Automatically map requests to `index.md` when it exists.
- [x] Port remaining (non-layout) HAML files to Ceylon.
- [x] Implement remaining layouts.
- [x] Properly map `/documentation/current/` to `/documentation/1.3/`.
- [x] Implement a sitemap and restore page properties that deal with it.
- [x] Convert `/data/urls.yml` to a more ceylonic format.
- [x] Implement a module that exports the website as static HTML that can be released. The module
      should also generate an `.htaccess` file, if possible.
- [ ] Export the various index pages that live in the `/blog/` directory.
- [ ] Implement redirects under `/documentation/(version)/reference/` subdirectories.
- [ ] Find a permanent solution for the SCSS to CSS conversion.
- [ ] Speed up the export module, possibly by checking file modification times and skipping files
      that have not been modified since they were last exported.
- [x] Develop a test procedure for the static website. Python's `SimpleHttpServer` doesn't support
      `.htaccess`, preventing proper exploration of the site.
- [x] Implement pagination on `/blog/`.
- [x] Fix blog post URL's to match current scheme.
- [x] Implement blog post feeds.
- [x] Properly identify which blog post feed is being linked to.
- [x] Show author's bio when viewing blog posts by an author.
- [x] Implement `/blog/authors/` and `/blog/tags/`.
- [ ] Verify that deep links still anchor to their intended targets.
- [ ] Handle deep linking where the target is raw HTML, instead of Markdown.
- [x] Decode Markdown file headers that use HTML entities.
- [ ] Update "How to Contribute" documentation, this file, and `RELEASE.md`.
- [ ] Address remaining `TODO` comments.
- [x] Get `ceylon.markdown` into the Herd!
- [ ] Get approval!
- [ ] Remove old HAML and YML content.
- [ ] (Maybe) Remove the `/_data/news/` directory, since the news section no longer exists.

## Future improvements

- [ ] Use partials for common elements in the sidebar.
- [ ] Convert `/_data/` content to use a more ceylonic structure.

---

# How to build [ceylon-lang.org](/)

A bit of Git, a bit a Ruby and you will get your local version of [ceylon-lang.org](/) served.

## Prerequisites

- Get [Git](http://git-scm.com)
- Get [Ruby](https://www.ruby-lang.org/en/) > 2.1
- If on Mac OS:
    - Get [XCode](https://developer.apple.com/xcode/) (needed for compilation of native gems)
- If on Linux:
    - Get *libxslt-dev* - eg via `sudo apt-get install libxslt-dev` (may be called *libxslt1-dev* for some distros)

Install Git to your system. [GitHub's help page](http://help.github.com/) is a good starting
point. [Emmanuel's blog](http://in.relation.to/Bloggers/HibernateMovesToGitGitTipsAndTricks)
on Git tips and tricks is useful too.

## Installation

### Ensure Rake is installed

Make sure [Rake](https://github.com/jimweirich/rake) is available. It is often installed per default.

<!-- lang: bash -->
    rake --version

If you get "_command not found_":

<!-- lang: bash -->
    gem install rake

### Ensure Bundler is installed

Make sure [Bundler](http://bundler.io/) is available. It manages your Ruby gems locally to the project
and prevents version conflicts between different Ruby projects. To quote from the website:

> Bundler provides a consistent environment for Ruby projects by tracking and installing the exact
> gems and versions that are needed.

<!-- lang: bash -->
    bundle -v

If you get "_command not found_":

<!-- lang: bash -->
    gem install bundler

### Get the source

<!-- lang: bash -->
    git clone git@github.com:ceylon/ceylon-lang.org.git
    cd ceylon-lang.org

### Setup awestruct

<!-- lang: bash -->
    rake setup
    rake check

Note that on existing installs, you might see the following error

    /Users/alice/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/rubygems/dependency.rb:298:in `to_specs': Could not find 'bundler' (>= 0) among 8 total gem(s) (Gem::LoadError)
            from /Users/alice/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/rubygems/dependency.rb:309:in `to_spec'
            from /Users/alice/.rvm/rubies/ruby-2.1.2/lib/ruby/2.1.0/rubygems/core_ext/kernel_gem.rb:53:in `gem'
            from /Users/alice/.rvm/gems/ruby-2.1.2/bin/bundle:22:in `<main>'
            from /Users/alice/.rvm/gems/ruby-2.1.2/bin/ruby_executable_hooks:15:in `eval'
            from /Users/alice/.rvm/gems/ruby-2.1.2/bin/ruby_executable_hooks:15:in `<main>'
    rake aborted!

It is due to a partial or corrupt installation of the bundles that you need to clear.
Do either of these operations:

<!-- lang: bash -->
    rake clean[all]
    # if that fails, do
    rm -fR .bundle _tmp _bin

Then run the `rake setup` command again.

## Serve the site locally

<!-- lang: bash -->
    rake preview

Point your browser to http://localhost:4242

Any change will be automatically picked up except for `_partials` files, `_base.css`
and sometimes new blog entries.

### Which other tasks exist in the Rake build file?

<!-- lang:bash -->
    rake --tasks

This will list the available tasks with a short description

### How to also include the spec and `ceylon doc` pages

**Is that obsolete?**

Use `./build-site.sh`. This will clone or refresh the spec, language and compiler repos 
into `_tmp` and build the appropriate artifacts before pushing them to the site.

If you have already run `./build-site.sh` and don't wish to rebuild the spec and ceylondoc,
use 

<!-- lang: bash -->
    ./build-site.sh --light

to simply copy them to the website structure. This is much faster.

### If your changes are not visible...

Panic! Then completely regenerate the site via:

<!-- lang: bash -->
    rake clean preview

### If serving the site is slow...

On Linux, serving the file may be atrociously slow 
(something to do with WEBRick).

Use the following alternative:

* Go in your `~/ceylon-lang.org` directory.  
* Run  `rake gen`
* In parallel, go to the `~/ceylon-lang.org/_site` directory
* Run `python -m SimpleHTTPServer 4242`

You should be back to millisecond serving :) 

# License

The content of this repository is released under 
[Creative Commons Attribution Share-Alike 3.0 Unported 
(CC BY-SA 3.0)](http://creativecommons.org/licenses/by-sa/3.0/).
Sample code available on this website is released under 
[Apache Software License 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).

By submitting a "pull request" or otherwise contributing to this repository, you
agree to license your contribution under the respective licenses mentioned above.

## Acknowledgements

This website uses:

- Icons from [Komodo Media, Rogie King][Komodo] (CC BY-SA 3.0 with link back to the creator)

[Komodo]: http://www.komodomedia.com
